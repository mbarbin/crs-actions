# summarize-crs-in-pr

A reusable GitHub Action to post or update a comment with a summary of CRs in a pull request.

## Usage

```yaml
- uses: mbarbin/crs-actions/summarize-crs-in-pr@<ref>
  with:
    crs-config: .github/crs-config.json
```

- See [`action.yml`](./action.yml) for all available options.

### Requirements

- The `crs` CLI must be available in the runner environment PATH.

### Permissions

To comment on a pull request, your workflow must have `pull-requests: write` permission:

```yaml
permissions:
  pull-requests: write
```

### Example Workflow

```yaml
name: Summarize CRs in PR

on:
  pull_request:
    branches: [main]

jobs:
  summarize-crs-in-pr:
    runs-on: ubuntu-latest
    permissions:
      pull-requests: write
    steps:
      - name: Checkout
        uses: actions/checkout@v4
      - name: Install crs
        uses: mbarbin/crs-actions/setup-crs@v1.0.0
        with:
          crs-version: 0.0.20250813
      - name: Summarize CRs in PR
        uses: mbarbin/crs-actions/summarize-crs-in-pr@v1.0.0
        with:
          crs-config: .github/crs-config.json
```

### Example crs-config.json

The config is expected to be a json5 file to save in the repo. For example:

```json
{
  "default_repo_owner": "user1",
  "user_mentions_allowlist": [
    "user1",
    "user2",
    "user5",
  ],
}
```

You can save it at `.github/crs-config.json` or specify a custom path with the `crs-config` input in your workflow.

### Empty Summary Initialization

By default, this action does not create a summary comment if a pull request has no CRs — helping to avoid unnecessary notifications for PRs that never have any CRs.

If you prefer to always create a summary comment (even when there are no CRs), you can opt in by setting `initialize-empty-summary: true`:

```yaml
- uses: mbarbin/crs-actions/summarize-crs-in-pr@<ref>
  with:
    initialize-empty-summary: true
```

This option only affects the initial creation of the summary comment. If a summary comment already exists and the PR later becomes CR-clean, the comment will always be updated to show that no CRs remain — regardless of the `initialize-empty-summary` setting.

### User Mentions

With `with-user-mentions: true`, the action is enabled to include `@user` mentions below the summary table for users who are assigned CRs.

**Note:**

- For user mentions to be effective, each user must be added to an allowlist in the crs config file to enable notifications for them.
- This is a two-step process:
  1. Enable user mentions in this action (set `with-user-mentions: true`). This is enabled by default.
  2. Edit your crs config to include the users allowed to be mentioned (field `user_mentions_allowlist`).
- The action itself only leaves `@user` mentions in comments; notification delivery depends on GitHub's handling of mentions and user settings.

### How it works

- Runs `crs` to create summary tables with the provided config and options.
- Posts or updates a PR comment with the summary in the PR conversation, using a hidden marker for idempotency. The comment is edited in place when changed.

### See it in action

Find a live workflow example for this action in the [crs-actions-examples](https://github.com/mbarbin/crs-actions-examples) repository.

## License

MIT. See [LICENSE](../LICENSE).
