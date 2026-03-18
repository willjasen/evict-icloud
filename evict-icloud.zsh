#!/bin/zsh

# This function checks if the item is pinned and evicts it if it is.
check_item_to_evict() {
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
  check_item_to_evict "$item"
done
