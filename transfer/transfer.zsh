transfer() {
  if [ -z "$TRANSFER_USER" ] || [ -z "$TRANSFER_PASS" ]; then
    echo "TRANSFER_USER and TRANSFER_PASS must be set in the environment." >&2
    return 1
  fi

  if [ $# -eq 0 ]; then
    echo "No arguments specified.

Usage:
  transfer <file|directory>
  ... | transfer <file_name>

Examples:
  transfer /tmp/test.md" >&2
    return 1
  fi

  if tty -s; then
    file="$1"
    file_name=$(basename "$file")

    if [ ! -e "$file" ]; then
      echo "$file: No such file or directory" >&2
      return 1
    fi

    if [ -d "$file" ]; then
      file_name="$file_name.zip"
      (cd "$file" && zip -r -q - .) | curl --progress-bar --upload-file "-" -u "$TRANSFER_USER:$TRANSFER_PASS" "https://transfer.feliciterra.com/$file_name" | tee /dev/null
    else
      cat "$file" | curl --progress-bar --upload-file "-" -u "$TRANSFER_USER:$TRANSFER_PASS" "https://transfer.feliciterra.com/$file_name" | tee /dev/null
    fi
  else
    file_name=$1
    curl --progress-bar --upload-file "-" -u "$TRANSFER_USER:$TRANSFER_PASS" "https://transfer.feliciterra.com/$file_name" | tee /dev/null
  fi
}
