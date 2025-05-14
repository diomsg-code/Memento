#!/usr/bin/env python3
import argparse
import os
import subprocess
import sys

def run_git(args, check=True):
    print(f"🧠 git {' '.join(args)}")
    subprocess.run(["git"] + args, check=check)

def create_and_push_annotated_tag(tag, message):
    result = subprocess.run(["git", "tag", "-l", tag], capture_output=True, text=True)
    if tag in result.stdout.split():
        print(f"⚠️ Tag '{tag}' existiert bereits.")
        sys.exit(99)

    run_git(["tag", "-a", tag, "-m", message])
    run_git(["push", f"refs/tags/{tag}"])

def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("--tag", required=True)
    parser.add_argument("--message", required=True)
    args = parser.parse_args()

    create_and_push_annotated_tag(args.tag, args.message)

if __name__ == "__main__":
    main()
