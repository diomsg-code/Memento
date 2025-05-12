#!/usr/bin/env python3
import argparse
import os
import subprocess
import sys

def run_git(args, check=True):
    print(f"🧠 git {' '.join(args)}")
    subprocess.run(["git"] + args, check=check)

def create_and_push_annotated_tag(tag, message, token, repo, name, email):
    result = subprocess.run(["git", "tag", "-l", tag], capture_output=True, text=True)
    if tag in result.stdout.split():
        print(f"⚠️ Tag '{tag}' existiert bereits.")
        sys.exit(99)

    run_git(["config", "user.name", name])
    run_git(["config", "user.email", email])
    run_git(["tag", "-a", tag, "-m", message])

    remote_url = f"https://x-access-token:{token}@github.com/{repo}.git"
    run_git(["push", remote_url, f"refs/tags/{tag}"])

def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("--tag", required=True)
    parser.add_argument("--message", required=True)
    parser.add_argument("--name", required=True)
    parser.add_argument("--email", required=True)
    args = parser.parse_args()

    token = os.getenv("GITHUB_TOKEN")
    repo = os.getenv("GITHUB_REPOSITORY")
    
    if not token or not repo:
        print("⚠️ GITHUB_TOKEN oder GITHUB_REPOSITORY fehlen.")
        sys.exit(99)

    create_and_push_annotated_tag(args.tag, args.message, token, repo, args.name, args.email)

if __name__ == "__main__":
    main()
