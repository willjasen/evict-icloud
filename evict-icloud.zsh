#!/bin/zsh

evict_item() {
  local item="$1"
  xattr -p "com.apple.fileprovider.pinned#PX" "$item" >/dev/null 2>&1
  if [ $? -eq 0 ]; then
    local rel="${item#./}"
    echo "Processing: $rel"
    xattr -d "com.apple.fileprovider.pinned#PX" "$item"
    brctl evict "$item"
  fi
}

find . \( -type f -o -type d \) -print0 | while IFS= read -r -d '' item; do
  evict_item "$item"
done