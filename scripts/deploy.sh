#!/bin/bash
# Copies the working tree into the WoW Forever AddOns folder for testing.
# Then /reload in game (or restart WoW the first time).
set -euo pipefail
ADDONS="${WOW_ADDONS:-/mnt/Games/CrossOver/World_of_Warcraft/drive_c/Program Files (x86)/World of Warcraft/_forever_/Interface/AddOns}"
SRC="$(cd "$(dirname "$0")/.." && pwd)"
mkdir -p "$ADDONS/Rucksack"
rsync -a --delete \
  --exclude '.git' --exclude '.github' --exclude '.gitignore' --exclude '.pkgmeta' \
  --exclude 'scripts' --exclude 'README.md' --exclude 'media' \
  "$SRC/" "$ADDONS/Rucksack/"
echo "Deployed to $ADDONS/Rucksack"
