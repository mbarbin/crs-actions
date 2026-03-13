# setup-crs

A reusable GitHub Action to download and install the [crs](https://github.com/mbarbin/crs) code review tool from a GitHub release.

## Usage

```yaml
- uses: mbarbin/crs-actions/setup-crs@<ref>
  with:
    crs-version: 0.0.20260307
    crs-digest: sha256:5097e709386d8d41351a87f86c8ad374db72aabe4ddc2a8ff2d58faebb1b889f
```

- The `crs-version` input is required and must match a [published release](https://github.com/mbarbin/crs/releases/) of crs.
- The `crs-digest` input is required for binary integrity verification. See [Digest Verification](#digest-verification).
- The action will install the `crs` binary and add it to the `PATH` for subsequent steps.

## Features

- Downloads the correct binary for the runner OS and architecture.
- Verifies the binary digest (required, see [Digest Verification](#digest-verification)).
- Verifies the build attestation (if `gh` CLI is available).
- Installs to a temporary directory and updates the `PATH`.

### Compatibility Note

The `crs-version` input is **mandatory** and upgrading it is the responsibility of the user. Upgrades should be done carefully. We recommend making the version change in a separate pull request, and in that PR, you can add test CRs to verify that everything works as expected.

The version of this action (`setup-crs`) is tied to the version of the `crs` binary it installs, because the action invokes `crs` with specific CLI flags and options that may change between versions.

Each version of the actions defined in this repository is tested and blessed for compatibility with specific versions of `crs`. The compatibility is documented as a table in the repository root `../README.md`.

### Digest Verification

The `crs-digest` input is **mandatory**. The action verifies the integrity of the downloaded binary against the expected digest, and will fail if they do not match.

The digest format is `algorithm:hash`, where `algorithm` is currently limited to `sha256`. GitHub automatically provides SHA256 checksums for release assets, which you can find on the [crs releases page](https://github.com/mbarbin/crs/releases/).

For a list of known SHA256 digests, see [DIGESTS.md](./DIGESTS.md).

## See it in action

Find a live workflow example for this action in the [crs-actions-examples](https://github.com/mbarbin/crs-actions-examples) repository.

## License

MIT. See [LICENSE](../LICENSE).
