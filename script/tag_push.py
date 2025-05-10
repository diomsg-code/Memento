import subprocess
import sys
import os

def git_run(args, check=True):
    print(f"🔧 git {' '.join(args)}")
    subprocess.run(["git"] + args, check=check)

def create_and_push_tag(tag_name, token, repo):
    # 1. Tag lokal erstellen
    git_run(["tag", tag_name])

    # 2. Remote-URL mit Token
    remote_url = f"https://x-access-token:{token}@github.com/{repo}.git"

    # 3. Tag pushen
    git_run(["push", remote_url, f"refs/tags/{tag_name}"])

if __name__ == "__main__":
    if len(sys.argv) < 2:
        print("Usage: tag_push.py <tag>")
        sys.exit(1)

    tag = sys.argv[1]
    token = os.getenv("G_TOKEN")
    repo = os.getenv("GITHUB_REPOSITORY")

    if not token or not repo:
        print("❌ G_TOKEN oder GITHUB_REPOSITORY fehlen")
        sys.exit(2)

    create_and_push_tag(tag, token, repo)