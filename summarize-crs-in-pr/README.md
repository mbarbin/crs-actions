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
          crs-version: 0.0.20250705
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
  "user_mentions_whitelist": [
    "user1",
    "user2",
    "user5",
  ],
}
```

You can save it at `.github/crs-config.json` or specify a custom path with the `crs-config` input in your workflow.

### User Mentions

With `with-user-mentions: true`, the action is enabled to include `@user` mentions below the summary table for users who are assigned CRs.

**Note:**

- For user mentions to be effective, each user must be added to a whitelist in the crs config file to enable notifications for them.
- This is a two-step process:
  1. Enable user mentions in this action (set `with-user-mentions: true`). This is enabled by default.
  2. Edit your crs config to include the users allowed to be mentioned (field `user_mentions_whitelist`).
- The action itself only leaves `@user` mentions in comments; notification delivery depends on GitHub's handling of mentions and user settings.

## How it works

- Runs `crs` to create summary tables with the provided config and options.
- Posts or updates a PR comment with the summary in the PR conversation, using a hidden marker for idempotency. The comment is edited in place when changed.

## License

MIT. See [LICENSE](../LICENSE).
