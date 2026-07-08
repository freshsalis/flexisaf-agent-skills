#!/usr/bin/env bash
set -euo pipefail

DEFAULT_WORKSPACE_ROOT="${HOME}/projects/flexisaf"
DEFAULT_PRD_PATH="/home/salisu/Downloads/Distinction Bytes (Mobile App).pdf"

BYTE_WORKSPACE_ROOT="${BYTE_WORKSPACE_ROOT:-$DEFAULT_WORKSPACE_ROOT}"
BYTE_PRD_PATH="${BYTE_PRD_PATH:-$DEFAULT_PRD_PATH}"
DISTINCTION_BYTES_REPO="${DISTINCTION_BYTES_REPO:-${BYTE_WORKSPACE_ROOT}/distinction-bytes}"
SAFLEARN_API_REPO="${SAFLEARN_API_REPO:-${BYTE_WORKSPACE_ROOT}/saflearn-api}"
BYTECORE_REPO="${BYTECORE_REPO:-${BYTE_WORKSPACE_ROOT}/bytecore}"

check_path() {
  local label="$1"
  local path="$2"

  if [[ -e "$path" ]]; then
    printf 'OK   %-24s %s\n' "$label" "$path"
  else
    printf 'MISS %-24s %s\n' "$label" "$path" >&2
    return 1
  fi
}

status=0

check_path "workspace-root" "$BYTE_WORKSPACE_ROOT" || status=1
check_path "prd" "$BYTE_PRD_PATH" || status=1
check_path "distinction-bytes" "$DISTINCTION_BYTES_REPO" || status=1
check_path "saflearn-api" "$SAFLEARN_API_REPO" || status=1
check_path "bytecore" "$BYTECORE_REPO" || status=1

printf '\nResolved variables:\n'
printf 'BYTE_WORKSPACE_ROOT=%q\n' "$BYTE_WORKSPACE_ROOT"
printf 'BYTE_PRD_PATH=%q\n' "$BYTE_PRD_PATH"
printf 'DISTINCTION_BYTES_REPO=%q\n' "$DISTINCTION_BYTES_REPO"
printf 'SAFLEARN_API_REPO=%q\n' "$SAFLEARN_API_REPO"
printf 'BYTECORE_REPO=%q\n' "$BYTECORE_REPO"

exit "$status"
