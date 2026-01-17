# comment-crs-in-pr

A reusable GitHub Action to comment on CRs in a pull request using reviewdog.

## Usage

```yaml
- uses: mbarbin/crs-actions/comment-crs-in-pr@<ref>
  with:
    crs-config: .github/crs-config.json
```

- See [`action.yml`](./action.yml) for all available options.

### Requirements

- The `crs` & `reviewdog` CLIs must be available in the runner environment PATH.

### Permissions

To comment on a pull request, your workflow must have `pull-requests: write` permission:

```yaml
permissions:
  pull-requests: write
```

### Example Workflow

```yaml
name: Comment on CRs in PR

on:
  pull_request:
    branches: [main]

jobs:
  comment-crs-in-pr:
    runs-on: ubuntu-latest
    permissions:
      pull-requests: write
    steps:
      - name: Checkout
        uses: actions/checkout@v6
      - name: Install crs
        uses: mbarbin/crs-actions/setup-crs@v1.0.0
        with:
          crs-version: 0.0.20250813
      - name: Install reviewdog
        uses: reviewdog/action-setup@d8edfce3dd5e1ec6978745e801f9c50b5ef80252 # v1.4.0
        with:
          reviewdog_version: v0.20.3
      - name: Comment on CRs in PR
        uses: mbarbin/crs-actions/comment-crs-in-pr@v1.0.0
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

You can find the config reference manual [here](https://mbarbin.github.io/crs/docs/reference/crs-actions-config/).

### User Mentions

With `with-user-mentions: true`, the action is enabled to include `@user` mentions in PR review comments for CRs assigned to users.

**Note:**

- For user mentions to be effective, each user must be added to an allowlist in the crs config file to enable notifications for them.
- This is a two-step process:
  1. Enable user mentions in this action (set `with-user-mentions: true`). This is enabled by default.
  2. Edit your crs config to include the users allowed to be mentioned (field `user_mentions_allowlist`).
- The action itself only leaves `@user` mentions in comments; notification delivery depends on GitHub's handling of mentions and user settings.

### See it in action

Find a live workflow example for this action in the [crs-actions-examples](https://github.com/mbarbin/crs-actions-examples) repository.

## License

MIT. See [LICENSE](../LICENSE).
