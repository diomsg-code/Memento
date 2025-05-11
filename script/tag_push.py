#!/usr/bin/env python3
import subprocess
import sys
import os

def run_git(args, check=True):
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
    
def create_and_push_annotated_tag(tag, message, token, repo):
    result = subprocess.run(["git", "tag", "-l", tag], capture_output=True, text=True)
    if tag in result.stdout.split():
        print(f"⚠️ Tag '{tag}' existiert bereits.")
        sys.exit(99)

    run_git(["config", "user.name", "GitHub Actions"])
    run_git(["config", "user.email", "actions@github.com"])
    run_git(["tag", "-s", "-a", tag, "-m", message])

    remote_url = f"https://x-access-token:{token}@github.com/{repo}.git"
    run_git(["push", remote_url, f"refs/tags/{tag}"])

def main():
    if len(sys.argv) != 3:
        print("⚠️ Verwendung: tag_push.py <tag> <release-type>")
        sys.exit(99)

    setup_gpg_and_git()

    tag = sys.argv[1]
    message = sys.argv[2]
    token = os.getenv("GITHUB_TOKEN")
    repo = os.getenv("GITHUB_REPOSITORY")

    if not token or not repo:
        print("⚠️ GITHUB_TOKEN oder GITHUB_REPOSITORY fehlen.")
        sys.exit(99)

    create_and_push_annotated_tag(tag, message, token, repo)

if __name__ == "__main__":
    main()
