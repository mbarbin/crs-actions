#!/usr/bin/env sh
set -eu

CRS_CONFIG="${CRS_CONFIG:-.github/crs-config.json}"
WITH_USER_MENTIONS="${WITH_USER_MENTIONS:-true}"
PULL_REQUEST_AUTHOR="${PULL_REQUEST_AUTHOR:?PULL_REQUEST_AUTHOR is required}"

crs tools reviewdog annotate-crs \
  --config="$CRS_CONFIG" \
  --review-mode=pull-request \
  --with-user-mentions="$WITH_USER_MENTIONS" \
  --pull-request-author="$PULL_REQUEST_AUTHOR" \
| reviewdog -f=rdjson -name="crs" -reporter=github-pr-review
