#!/bin/zsh

# Destination directory
DEST="$HOME/.config/zsh"

# Files to copy
FILES=(".zshrc" ".alias.zsh")

# Ensure destination exists
mkdir -p "$DEST"

# Copy files
for file in $FILES; do
  SRC="$HOME/$file"
  if [[ -f "$SRC" ]]; then
    cp "$SRC" "$DEST"
    echo "✅ Copied $file to $DEST"
  else
    echo "⚠️  Skipped $file (not found)"
  fi
done


## chmod +x sync_zsh_config.zsh
# use this command ./sync_zsh_config.zsh
# or using alias sync_config
