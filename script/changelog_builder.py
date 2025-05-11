#!/usr/bin/env python3
import argparse
import datetime
import os
import re
import subprocess
import sys

def run_git(args: list[str], check=True):
    print(f"🧠 git {' '.join(args)}")
    subprocess.run(["git"] + args, check=check)


def run(cmd, **kwargs):
    print(f"> {cmd}")
    subprocess.run(cmd, shell=True, check=True, **kwargs)

def setup_gpg_and_git():
    # 1) Import private key (wie gehabt) …
    run("gpg --batch --import", input=os.environ["GPG_PRIVATE_KEY"].encode())

    # 2) Erlaube Loopback-Pinentry
    run('mkdir -p ~/.gnupg')
    run('echo "allow-loopback-pinentry" >> ~/.gnupg/gpg-agent.conf')
    run('echo "pinentry-mode loopback" >> ~/.gnupg/gpg.conf')
    run("gpgconf --kill gpg-agent")

    # 3) Git so konfigurieren, dass es nur das gpg-Executable aufruft
    gpg_key = os.environ["GPG_KEY_ID"]
    run_git(["config", "--global", "gpg.program", "gpg"])
    run_git(["config", "--global", "user.signingKey", gpg_key])
    run_git(["config", "--global", "commit.gpgSign", "true"])
    run_git(["config", "--global", "tag.gpgSign", "true"])

def extract_latest_changelog_block(changelog_path: str) -> str:
    if not os.path.isfile(changelog_path):
        return ""

    with open(changelog_path, encoding="utf-8") as f:
        lines = f.readlines()

    in_block = False
    block = []
    for line in lines:
        if re.match(r"^### \[.*\]", line):
            if in_block:
                break
            in_block = True
            continue
        if in_block and line.strip().startswith("-"):
            block.append(line.strip())

    return "\n".join(f"- {line.lstrip('- ').strip()}" for line in block if line.strip())

def create_new_section(version: str, entries: str) -> str:
    today = datetime.date.today().isoformat()
    header = f"**{version} ({today})**"
    return f"{header}\n{entries}\n"

def update_full_changelog(new_block: str, full_path: str):
    old_content = ""
    if os.path.isfile(full_path):
        with open(full_path, encoding="utf-8") as f:
            old_content = f.read()

    with open(full_path, "w", encoding="utf-8") as f:
        f.write(new_block)
        f.write("\n")
        f.write(old_content)

def git_commit_and_push(version: str, file_path: str):
    run_git(["config", "user.name", "GitHub Actions"])
    run_git(["config", "user.email", "actions@github.com"])
    run_git(["add", file_path])
    run_git(["commit", "-S", "-m", f"Update changelog for {version}"])
    run_git(["push"])

def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("--version", required=True)
    parser.add_argument("--changelog", default="CHANGELOG.md")
    parser.add_argument("--full", default="FULL-CHANGELOG.md")
    args = parser.parse_args()

    print(f"🔧 Baue FULL-CHANGELOG.md für Version: {args.version}")
    entries = extract_latest_changelog_block(args.changelog)
    if not entries:
        print("⚠️ Keine gültigen Einträge gefunden.")
        sys.exit(99)

    new_section = create_new_section(args.version, entries)
    update_full_changelog(new_section, args.full)

    setup_gpg_and_git()

    git_commit_and_push(args.version, args.full)

    print("✅ FULL-CHANGELOG.md aktualisiert und gepusht.")

if __name__ == "__main__":
    main()
