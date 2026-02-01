# setup-crs

A reusable GitHub Action to download and install the [crs](https://github.com/mbarbin/crs) code review tool from a GitHub release.

## Usage

```yaml
- uses: mbarbin/crs-actions/setup-crs@<ref>
  with:
    crs-version: 0.0.20250813
```

- The `crs-version` input is required and must match a [published release](https://github.com/mbarbin/crs/releases/) of crs.
- The action will install the `crs` binary and add it to the `PATH` for subsequent steps.

## Features

- Downloads the correct binary for the runner OS and architecture.
- Verifies the binary digest (optional, see [Digest Verification](#digest-verification)).
- Verifies the build attestation (if `gh` CLI is available).
- Installs to a temporary directory and updates the `PATH`.

### Compatibility Note

The `crs-version` input is **mandatory** and upgrading it is the responsibility of the user. Upgrades should be done carefully. We recommend making the version change in a separate pull request, and in that PR, you can add test CRs to verify that everything works as expected.

The version of this action (`setup-crs`) is tied to the version of the `crs` binary it installs, because the action invokes `crs` with specific CLI flags and options that may change between versions.

Each version of the actions defined in this repository is tested and blessed for compatibility with specific versions of `crs`. The compatibility is documented as a table in the repository root `../README.md`.

### Digest Verification

You can optionally verify the integrity of the downloaded binary by providing an expected digest. If the digest does not match, the action will fail.

```yaml
- uses: mbarbin/crs-actions/setup-crs@<ref>
  with:
    crs-version: 0.0.20251014
    crs-digest: sha256:82ac2264a2b6bd6e3dc47b1ff273eebc2682efe3ad255b14eab9b001b9c1eee6
```

The digest format is `algorithm:hash`, where `algorithm` is currently limited to `sha256`. GitHub automatically provides SHA256 checksums for release assets, which you can find on the [crs releases page](https://github.com/mbarbin/crs/releases/).

For a list of known SHA256 digests, see [DIGESTS.md](./DIGESTS.md).

## See it in action

Find a live workflow example for this action in the [crs-actions-examples](https://github.com/mbarbin/crs-actions-examples) repository.

## License

MIT. See [LICENSE](../LICENSE).
