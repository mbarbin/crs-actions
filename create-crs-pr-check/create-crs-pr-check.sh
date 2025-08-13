#!/bin/sh
# SPDX-FileCopyrightText: 2025 Mathieu Barbin <mathieu.barbin@gmail.com>
# SPDX-License-Identifier: MIT
set -eu

CRS_CONFIG="${CRS_CONFIG:-.github/crs-config.json}"
WITH_USER_MENTIONS="${WITH_USER_MENTIONS:-true}"
PULL_REQUEST_AUTHOR="${PULL_REQUEST_AUTHOR:?PULL_REQUEST_AUTHOR is required}"
PULL_REQUEST_BASE="${PULL_REQUEST_BASE:?PULL_REQUEST_BASE is required}"

TMPFILE=$(mktemp)
trap 'rm -f "$TMPFILE"' EXIT

crs tools reviewdog annotate-crs \
  --config="$CRS_CONFIG" \
  --review-mode=pull-request \
  --with-user-mentions="$WITH_USER_MENTIONS" \
  --pull-request-author="$PULL_REQUEST_AUTHOR" \
  --pull-request-base="$PULL_REQUEST_BASE" \
  > "$TMPFILE"
status=$?
reviewdog -f=rdjson -name="crs" -reporter=github-pr-check < "$TMPFILE"
rm -f "$TMPFILE"
exit $status
