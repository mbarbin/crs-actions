#!/bin/sh
# SPDX-FileCopyrightText: 2025 Mathieu Barbin <mathieu.barbin@gmail.com>
# SPDX-License-Identifier: MIT
set -eu

CRS_CONFIG="${CRS_CONFIG:-.github/crs-config.json}"
PULL_REQUEST_AUTHOR="${PULL_REQUEST_AUTHOR:?PULL_REQUEST_AUTHOR is required}"
PULL_REQUEST_BASE="${PULL_REQUEST_BASE:?PULL_REQUEST_BASE is required}"

crs tools github annotate-crs \
  --config="$CRS_CONFIG" \
  --review-mode=pull-request \
  --pull-request-author="$PULL_REQUEST_AUTHOR" \
  --pull-request-base="$PULL_REQUEST_BASE"
