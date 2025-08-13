# crs-actions

Reusable GitHub Actions for the [crs](https://github.com/mbarbin/crs) code review tool.

[![CI](https://github.com/mbarbin/crs-actions/actions/workflows/ci.yml/badge.svg)](https://github.com/mbarbin/crs-actions/actions/workflows/ci.yml)
[![Test](https://github.com/mbarbin/crs-actions/actions/workflows/test-setup-crs.yml/badge.svg)](https://github.com/mbarbin/crs-actions/actions/workflows/test-setup-crs.yml)
[![Release](https://github.com/mbarbin/crs-actions/actions/workflows/create-release-on-tag.yml/badge.svg)](https://github.com/mbarbin/crs-actions/actions/workflows/create-release-on-tag.yml)

## Actions

- [`setup-crs`](./setup-crs/README.md): Install the crs executable for use in workflows.
- [`comment-crs-in-pr`](./comment-crs-in-pr/README.md): Comment on CRs in a pull request using reviewdog.
- [`annotate-crs-in-pr`](./annotate-crs-in-pr/README.md): Annotate CRs in a pull request with GHA workflow annotations.
- [`create-crs-pr-check`](./create-crs-pr-check/README.md): Create a GitHub check with CRs in a pull request using reviewdog.
- [`create-crs-pr-job-summary`](./create-crs-pr-job-summary/README.md): Create a GitHub Job Summary with CRs in a pull request.
- [`summarize-crs-in-pr`](./summarize-crs-in-pr/README.md): Post or update a comment with a summary of CRs in a pull request.

## Compatibility

| Action Version     | Blessed crs Version | Status | Note                      |
|:------------------:|:-------------------:|:------:|:--------------------------|
| v1.0.0-alpha.8     | 0.0.20250813        | ✅     | latest, recommended       |
| v1.0.0-alpha.8     | 0.0.20250705        | 🟡     | compatible, with warnings |
| <= v1.0.0-alpha.7  | 0.0.20250813        | 🔴     | not supported             |
| <= v1.0.0-alpha.7  | 0.0.20250705        | 🟢     | supported                 |
| <= v1.0.0-alpha.7  | 0.0.20250626        | 🟢     | supported                 |

_This table will be updated as new versions are released._

## Live Examples

Curious how these actions work in practice? Visit the [crs-actions-examples](https://github.com/mbarbin/crs-actions-examples) repository for a collection of workflow examples covering all actions defined here. These examples are designed to give you a quick preview and help you browse and discover how each workflow operates — a handy resource as you explore and experiment!

## Usage, Documentation, Links & Resources

- See each action's `README.md` and `action.yml` for detailed usage and options.
- The documentation of the [crs](https://mbarbin.github.io/crs/) tool.
- Some workflows involve the very useful [reviewdog](https://github.com/reviewdog/reviewdog) code review integration tool. Make sure to give it a ⭐ on GitHub if you like it!
- Repo with live examples [crs-actions-examples](https://github.com/mbarbin/crs-actions-examples).

## TODO

- "on-push" workflows for revision based checks (e.g. checking the tip of the main branch).

Currently we've focused the effort on PRs only.

## Feedback

 The workflows provided here are experimental examples, showcasing what should be possible combining GitHub Actions tools with crs. This space is new and evolving, and we’re eager to learn how these workflows can be integrated and adapted to fit real projects. Feel free to mix, match, and tweak the workflows and their parameters to suit your needs. We warmly encourage adventurous users to share feedback, ideas, or questions in the project’s discussion space or by opening an issue — your input will help shape future improvements! Thank you.
