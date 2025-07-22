# crs-actions

Reusable GitHub Actions for the [crs](https://github.com/mbarbin/crs) code review tool.

[![CI](https://github.com/mbarbin/crs-actions/actions/workflows/ci.yml/badge.svg)](https://github.com/mbarbin/crs-actions/actions/workflows/ci.yml)
[![Test](https://github.com/mbarbin/crs-actions/actions/workflows/test-setup-crs.yml/badge.svg)](https://github.com/mbarbin/crs-actions/actions/workflows/test-setup-crs.yml)
[![Release](https://github.com/mbarbin/crs-actions/actions/workflows/create-release-on-tag.yml/badge.svg)](https://github.com/mbarbin/crs-actions/actions/workflows/create-release-on-tag.yml)

## Actions

- [`setup-crs`](./setup-crs/README.md): Installs the crs executable for use in workflows.
- [`comment-crs-in-pr`](./comment-crs-in-pr/README.md): Comments on CRs in a pull request using reviewdog.
- [`annotate-crs-in-pr`](./annotate-crs-in-pr/README.md): Annotate CRs in a pull request with GHA workflow annotations.
- [`create-crs-pr-check`](./create-crs-pr-check/README.md): Create a GitHub check with CRs in a pull request using reviewdog.

## Compatibility

| Action Version | Blessed crs Version | Note                   |
|:--------------:|:-------------------:|:-----------------------|
| v1.0.0         | 0.0.20250705        | latest, recommended    |
| v1.0.0         | 0.0.20250626        | supported              |

_This table will be updated as new versions are released._

## Usage, Documentation, Links & Resources

- See each action's `README.md` and `action.yml` for detailed usage and options.
- The documentation of the [crs](https://mbarbin.github.io/crs/) tool.
- Some workflows involve the very useful [reviewdog](https://github.com/reviewdog/reviewdog) code review integration tool. Make sure to give it a star if you like it!
