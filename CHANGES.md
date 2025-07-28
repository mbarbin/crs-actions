## 1.0.0-alpha.7 (unreleased)

### Changed

- Make `summarize-crs-in-pr` not create an initial comment with no CRs unless customized (@mbarbin).
- Moved back under `mbarbin/`, done with gh-transfert testing for now (@mbarbin).

## 1.0.0-alpha.6 (2025-07-23)

### Changed

- Moved repo under org `cr-review-tools/` (@mbarbin).

## 1.0.0-alpha.5 (2025-07-22)

### Added

- Add workflow `summarize-crs-in-pr` (#16, @mbarbin).
- Add workflow `create-crs-pr-job-summary` (#15, @mbarbin).
- Add workflow `create-crs-pr-check` (#14, @mbarbin).
- Add workflow `annotate-crs-in-pr` (#13, @mbarbin).

### Changed

- Update latest `crs` version (#12, @mbarbin).
- Prepare populating the PR base revision (#11, @mbarbin).
- Improve internal scripts (#9, @mbarbin).

### Removed

- Removed `v1` tag. Require upgrading to a specific version (#10, @mbarbin).

## 1.0.0-alpha.4 (2025-06-30)

### Changed

- Switch to kebab case for actions inputs/outputs (#8, @mbarbin).

## 1.0.0-alpha.3 (2025-06-30)

### Added

- Add notes and helpers to create releases (#7, @mbarbin).
- Add licenses notices (#5, @mbarbin)

### Changed

- Switch to use `sh` in scripts (#6, @mbarbin).

### Fixed

- Fixed invalid action path in `comment-crs-in-pr` README (#3, @mbarbin).

## 1.0.0-alpha.2 (2025-06-28)

### Added

- Add support for including changelog entries in GitHub release notes automatically.

## 1.0.0-alpha.1 (2025-06-28)

### Added

- Initial alpha release of crs-actions. Provides reusable GitHub Actions for the crs code review tool, including setup-crs and comment-crs-in-pr actions.
