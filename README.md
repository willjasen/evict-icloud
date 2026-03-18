# evict-icloud
remove "keep downloaded" files from icloud drive

This script helps to free up local disk space used by iCloud Drive on macOS by removing the "Keep Downloaded" attribute from files and directories, then removing (evicting) the downloaded data from the local drive.

macOS does not give a very easy way to manage from its GUI which files and folders have been selected with the "Keep Downloaded" attribute, leaving one to hunt manually through directories recursively to find items that can unchecked in order to free up local disk space. Naturally, that is very unwieldy, so this script runs recursively on the directory it is run from and will automatically remove that attribute from any files or folders it finds, then will evict its contents from the local disk.

All data remains in iCloud and can be downloaded again - it is only evicted from the local disk.