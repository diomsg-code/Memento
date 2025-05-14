#!/usr/bin/env python3
import subprocess
import re
import sys
import configparser
from pathlib import Path

def load_major_from_ini(path="version.ini", section="global", key="major"):
    """
    Lädt die Major-Version aus der angegebenen INI-Datei.
    Erwartet eine Sektion [global] und darin den Schlüssel 'major'.
    """
    config = configparser.ConfigParser()
    config.read(path)
    try:
        return int(config[section][key])
    except KeyError:
        print(f"⚠️ Sektion '{section}' oder Schlüssel '{key}' nicht gefunden in {path}", file=sys.stderr)
        sys.exit(1)
    except ValueError:
        print(f"⚠️ Ungültiger Integer-Wert für '{key}' in Sektion '{section}' ({config[section].get(key)})", file=sys.stderr)
        sys.exit(1)
    except Exception as e:
        print(f"⚠️ Fehler beim Lesen der INI-Datei {path}: {e}", file=sys.stderr)
        sys.exit(1)


def get_tags():
    subprocess.run(["git", "fetch", "--tags"], check=True)
    result = subprocess.run(
        ["git", "tag", "--sort=-creatordate"],
        stdout=subprocess.PIPE,
        text=True,
        check=True
    )
    return result.stdout.strip().splitlines()


def parse_release_tags(tags, major):
    pattern = re.compile(rf"v{major}\.(\d+)$")
    releases = []
    for tag in tags:
        m = pattern.fullmatch(tag)
        if m:
            releases.append((int(m.group(1)), tag))
    return sorted(releases, key=lambda x: x[0], reverse=True)


def parse_alpha_tags(tags, major, minor):
    pattern = re.compile(rf"v{major}\.{minor}-alpha\.(\d+)$")
    alphas = []
    for tag in tags:
        m = pattern.fullmatch(tag)
        if m:
            alphas.append((int(m.group(1)), tag))
    return sorted(alphas, key=lambda x: x[0], reverse=True)


def compute_new_tag(tags, major, release_type):
    releases = parse_release_tags(tags, major)
    last_minor = releases[0][0] if releases else -1
    new_minor = last_minor + 1

    if release_type.lower() == "release":
        return f"v{major}.{new_minor}"
    else:
        alphas = parse_alpha_tags(tags, major, new_minor)
        next_alpha = alphas[0][0] + 1 if alphas else 1
        return f"v{major}.{new_minor}-alpha.{next_alpha}"


def main():
    # Optionales Argument: 'release' oder 'alpha'
    release_type = sys.argv[1] if len(sys.argv) > 1 else "release"
    ini_path = Path(__file__).parent / "version.ini"
    major = load_major_from_ini(path=ini_path)

    tags = get_tags()
    # Ältestes Tag insgesamt (nach creatordate sortiert desc)
    last_tag = tags[0] if tags else None

    # Letztes Release-Tag für diese Major-Version
    releases = parse_release_tags(tags, major)
    last_release_tag = releases[0][1] if releases else None

    new_tag = compute_new_tag(tags, major, release_type)

    # Ausgaben
    print(f"NEW_TAG={new_tag}")
    print(f"LAST_RELEASE_TAG={last_release_tag}")
    print(f"LAST_TAG={last_tag}")
    print(f"ℹ️ Generiertes neues Tag: {new_tag}", file=sys.stderr)
    print(f"ℹ️ Letztes Release-Tag: {last_release_tag}", file=sys.stderr)
    print(f"ℹ️ Letztes Tag insgesamt: {last_tag}", file=sys.stderr)


if __name__ == "__main__":
    main()
