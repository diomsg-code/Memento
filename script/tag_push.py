#!/usr/bin/env python3
import subprocess
import sys
import os


def run_git(args, check=True):
    """Hilfsfunktion für git-Befehle mit Ausgabe."""
    print(f"🧠 git {' '.join(args)}")
    subprocess.run(["git"] + args, check=check)


def create_and_push_annotated_tag(tag, message, token, repo):
    """
    Erstellt einen annotierten Git-Tag und pusht ihn via HTTPS-Token.
    :param tag:     Tag-Name (z. B. v1.2.3)
    :param message: Nachricht für das Tag
    :param token:   GitHub PAT mit Schreibrechten
    :param repo:    GitHub-Repo (z. B. user/repo)
    """
    # Git-Author setzen (nur lokal)
    run_git(["config", "user.name", "GitHub Actions"])
    run_git(["config", "user.email", "actions@github.com"])

    # Prüfe, ob Tag schon existiert
    result = subprocess.run(["git", "tag", "-l", tag], capture_output=True, text=True)
    if tag in result.stdout.split():
        print(f"🔁 Tag '{tag}' existiert bereits – kein neues Tag gesetzt.")
        return

    print(f"🏷 Erstelle annotierten Tag '{tag}' mit Nachricht: '{message}'")
    run_git(["tag", "-a", tag, "-m", message])

    remote_url = f"https://x-access-token:{token}@github.com/{repo}.git"
    print(f"🚀 Pushe Tag '{tag}' nach GitHub ...")
    run_git(["push", remote_url, f"refs/tags/{tag}"])


# Direkt ausführbar
if __name__ == "__main__":
    if len(sys.argv) < 3:
        print("❌ Verwendung: tag_push.py <tag> <nachricht>")
        sys.exit(1)

    tag = sys.argv[1]
    message = sys.argv[2]
    token = os.getenv("G_TOKEN")
    repo = os.getenv("GITHUB_REPOSITORY")

    if not token or not repo:
        print("❌ G_TOKEN oder GITHUB_REPOSITORY fehlen")
        sys.exit(2)

    create_and_push_annotated_tag(tag, message, token, repo)
