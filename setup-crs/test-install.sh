#!/usr/bin/env bash
set -euo pipefail

# Usage: ./test-install.sh <version>
if [ $# -ne 1 ]; then
  echo "Usage: $0 <crs-version>" >&2
  exit 1
fi

CRS_VERSION="$1"
FAKE_TMPDIR="$(mktemp -d)"

# Set up fake GitHub Actions environment variables
export CRS_VERSION
export RUNNER_TEMP="$FAKE_TMPDIR"
export RUNNER_OS="Linux"
export GITHUB_PATH="$FAKE_TMPDIR/github_path.txt"

# Remove any previous crs binary in the temp dir
rm -f "$FAKE_TMPDIR/crs/bin/crs"

# Run the install script
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
"$SCRIPT_DIR/install.sh"

# Check if the binary was installed
if [ -x "$FAKE_TMPDIR/crs/bin/crs" ]; then
  echo "crs binary installed successfully at $FAKE_TMPDIR/crs/bin/crs"
  "$FAKE_TMPDIR/crs/bin/crs" --version
else
  echo "Error: crs binary was not installed in $FAKE_TMPDIR/crs/bin/crs" >&2
  exit 1
fi

# Show the updated GITHUB_PATH
if [ -f "$FAKE_TMPDIR/github_path.txt" ]; then
  echo "GITHUB_PATH contents:"
  cat "$FAKE_TMPDIR/github_path.txt"
fi

# Cleanup tempdir on exit
trap 'rm -rf "$FAKE_TMPDIR"' EXIT
