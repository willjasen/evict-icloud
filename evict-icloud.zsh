#!/bin/zsh

find . \( -type f -o -type d \) -exec sh -c '
  xattr -p "com.apple.fileprovider.pinned#PX" "$1" >/dev/null 2>&1
  if [ $? -eq 0 ]; then
    REL="${1#./}"
    echo "Processing: $REL"
    xattr -d "com.apple.fileprovider.pinned#PX" "$1"
    brctl evict "$1"
  fi
' -- {} \;