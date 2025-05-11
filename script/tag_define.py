#!/usr/bin/env python3
import subprocess
import re
import sys

def get_tags():
    subprocess.run(["git", "fetch", "--tags"], check=True)
    result = subprocess.run(["git", "tag", "--sort=-creatordate"], stdout=subprocess.PIPE, text=True, check=True)
    return result.stdout.strip().splitlines()

def get_last_release_tag(tags):
    for tag in tags:
        if re.fullmatch(r"v[0-9]+", tag):
            return tag
    return "v0"

def get_last_tag(tags):
    for tag in tags:
        if re.fullmatch(r"v[0-9]+(?:-alpha\.[0-9]+)?", tag):
            return tag
    return "v0"

def compute_new_tag(last_tag, release_type):
    base_match = re.match(r"v([0-9]+)", last_tag)
    if not base_match:
        print(f"⚠️ Unerwartetes Tag-Format: {last_tag}", file=sys.stderr)
        sys.exit(99)

    base_num = int(base_match.group(1))
    suffix = last_tag[len(f"v{base_num}"):]

    if suffix.startswith("-alpha."):
        alpha_num = int(suffix.split(".")[1])
        if release_type == "Alpha":
            return f"v{base_num}-alpha.{alpha_num + 1}"
        elif release_type == "Release":
            return f"v{base_num}"
    else:
        if release_type == "Release":
            return f"v{base_num + 1}"
        elif release_type == "Alpha":
            return f"v{base_num + 1}-alpha.1"

    print("⚠️ Konnte neuen Tag nicht bestimmen.", file=sys.stderr)
    sys.exit(99)

def main():
    release_type = sys.argv[1] if len(sys.argv) > 1 else "Release"
    tags = get_tags()
    last_release_tag = get_last_release_tag(tags)
    last_tag = get_last_tag(tags)
    new_tag = compute_new_tag(last_tag, release_type)

    print(f"LAST_RELEASE_TAG={last_release_tag}")
    print(f"LAST_TAG={last_tag}")
    print(f"NEW_TAG={new_tag}")

    print(f"ℹ️ Letzter Release Tag: {last_release_tag}", file=sys.stderr)
    print(f"ℹ️ Letzter Tag: {last_tag}", file=sys.stderr)
    print(f"ℹ️ Neuer Tag: {new_tag}", file=sys.stderr)

if __name__ == "__main__":
    main()