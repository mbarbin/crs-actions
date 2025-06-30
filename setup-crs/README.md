# setup-crs

A reusable GitHub Action to download and install the [crs](https://github.com/mbarbin/crs) code review tool from a GitHub release.

## Usage

```yaml
- uses: mbarbin/crs-actions/setup-crs@<ref>
  with:
    crs_version: 0.0.20250626
```

- The `crs_version` input is required and must match a published release of crs.
- The action will install the `crs` binary and add it to the `PATH` for subsequent steps.

### Compatibility Note

The `crs_version` input is **mandatory** and upgrading it is the responsibility of the user. Upgrades should be done carefully. We recommend making the version change in a separate pull request, and in that PR, you can add test CRs to verify that everything works as expected.

The version of this action (`setup-crs`) is tied to the version of the `crs` binary it installs, because the action invokes `crs` with specific CLI flags and options that may change between versions.

Each version of this action is tested and blessed for compatibility with specific versions of `crs`.

| Action Version | Blessed crs Version |
|:--------------:|:-------------------:|
| v1             | 0.0.20250626        |

_This table will be updated as new versions are released._

## Features

- Downloads the correct binary for the runner OS and architecture.
- Verifies the build attestation (if `gh` CLI is available).
- Installs to a temporary directory and updates the `PATH`.

## License

See [LICENSE](../LICENSE).
