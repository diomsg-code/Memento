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
    # Sort descending by minor number
    return sorted(releases, key=lambda x: x[0], reverse=True)

def compute_new_tag(tags, major, release_type):
    # Ermittlung des nächsten Minor
    current_releases = parse_release_tags(tags, major)
    last_minor = current_releases[0][0] if current_releases else -1
    new_minor = last_minor + 1

    if release_type.lower() == "release":
        return f"v{major}.{new_minor}"
    # Alpha-Build
    alphas = []
    pattern_alpha = re.compile(rf"v{major}\.{new_minor}-alpha\.(\d+)$")
    for tag in tags:
        m = pattern_alpha.fullmatch(tag)
        if m:
            alphas.append(int(m.group(1)))
    next_alpha = max(alphas) + 1 if alphas else 1
    return f"v{major}.{new_minor}-alpha.{next_alpha}"

def determine_last_release_tag(tags, major, new_tag):
    """
    Ermittelt das letzte Release-Tag vor dem neuen Tag:
    - Wenn es schon Releases in aktueller Major-Version gibt, nimm das mit zweitgrößtem Minor.
    - Andernfalls nimm das höchste Release-Tag der vorherigen Major-Version.
    """
    # Tags der aktuellen Major-Version
    current = parse_release_tags(tags, major)
    # Falls mindestens zwei Releases existieren, zweiter Eintrag ist vorheriges
    if len(current) >= 2:
        return current[1][1]
    # Kein oder nur ein Release: suche im vorherigen Major
    prev = parse_release_tags(tags, major - 1)
    if prev:
        return prev[0][1]
    return None

def main():
    release_type = sys.argv[1] if len(sys.argv) > 1 else "release"
    ini_path = ".build/build.ini"
    major = load_major_from_ini(path=ini_path)

    tags = get_tags()
    new_tag = compute_new_tag(tags, major, release_type)
    last_tag = tags[0] if tags else None
    last_release_tag = determine_last_release_tag(tags, major, new_tag)

    # Parsable Ausgaben
    print(f"NEW_TAG={new_tag}")
    print(f"LAST_RELEASE_TAG={last_release_tag}")
    print(f"LAST_TAG={last_tag}")

    # Debug/Info stderr
    print(f"ℹ️ Generiertes neues Tag: {new_tag}", file=sys.stderr)
    print(f"ℹ️ Letztes Release-Tag: {last_release_tag}", file=sys.stderr)
    print(f"ℹ️ Letztes Tag insgesamt: {last_tag}", file=sys.stderr)

if __name__ == "__main__":
    main()
