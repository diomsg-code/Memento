#!/usr/bin/env python3
import subprocess
import sys
import os

def run_git(args, check=True):
    print(f"🧠 git {' '.join(args)}")
    subprocess.run(["git"] + args, check=check)


def create_and_push_annotated_tag(tag, message, token, repo):
    result = subprocess.run(["git", "tag", "-l", tag], capture_output=True, text=True)
    if tag in result.stdout.split():
        print(f"🔁 Tag '{tag}' existiert bereits – kein neues Tag gesetzt.")
        return

    print(f"🏷 Erstelle annotierten Tag '{tag}' mit Nachricht: '{message}'")
    run_git(["tag", "-a", tag, "-m", message])

    remote_url = f"https://x-access-token:{token}@github.com/{repo}.git"
    print(f"🚀 Pushe Tag '{tag}' nach {repo} ...")
    run_git(["push", remote_url, f"refs/tags/{tag}"])

if __name__ == "__main__":
    if len(sys.argv) < 3:
        print("❌ Verwendung: git_push.py <tag> <nachricht>")
        sys.exit(1)

    tag = sys.argv[1]
    message = sys.argv[2]
    token = os.getenv("G_TOKEN")
    repo = os.getenv("GITHUB_REPOSITORY")

    if not token or not repo:
        print("❌ G_TOKEN oder GITHUB_REPOSITORY fehlen")
        sys.exit(2)

    create_and_push_annotated_tag(tag, message, token, repo)