# create-crs-pr-check

A reusable GitHub Action to create a [GitHub Check](https://docs.github.com/en/pull-requests/collaborating-with-pull-requests/collaborating-on-repositories-with-code-quality-features/about-status-checks) with CRs in a pull request.

## Usage

```yaml
- uses: mbarbin/crs-actions/create-crs-pr-check@<ref>
  with:
    crs-config: .github/crs-config.json
```

- See [`action.yml`](./action.yml) for all available options.

### Requirements

- The `crs` & `reviewdog` CLIs must be available in the runner environment PATH.

### Permissions

To create a status check on a pull request, your workflow must have `pull-requests: write` permission:

```yaml
permissions:
  pull-requests: write
```

### Example Workflow

```yaml
name: Create CRs PR Check

on:
  pull_request:
    branches: [main]

jobs:
  create-crs-pr-check:
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
      - name: Install reviewdog
        uses: reviewdog/action-setup@v1
      - name: Create CRs PR Check
        uses: mbarbin/crs-actions/create-crs-pr-check@v1.0.0
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

## License

MIT. See [LICENSE](../LICENSE).
