# annotate-crs-in-pr

A reusable GitHub Action to annotate CRs in a pull request using GHA [annotations](https://docs.github.com/en/actions/reference/workflow-commands-for-github-actions).

## Usage

```yaml
- uses: mbarbin/crs-actions/annotate-crs-in-pr@<ref>
  with:
    crs-config: .github/crs-config.json
```

- See [`action.yml`](./action.yml) for all available options.

### Requirements

- The `crs` CLI must be available in the runner environment PATH.

### Permissions

This workflow only needs the default read permission.

```yaml
permissions:
  contents: read
```

### Example Workflow

```yaml
name: Annotate CRs in PR

on:
  pull_request:
    branches: [main]

jobs:
  annotate-crs-in-pr:
    runs-on: ubuntu-latest
    permissions:
      contents: read
    steps:
      - name: Checkout
        uses: actions/checkout@v5
      - name: Install crs
        uses: mbarbin/crs-actions/setup-crs@v1.0.0
        with:
          crs-version: 0.0.20250813
      - name: Annotate CRs in PR
        uses: mbarbin/crs-actions/annotate-crs-in-pr@v1.0.0
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

### See it in action

Find a live workflow example for this action in the [crs-actions-examples](https://github.com/mbarbin/crs-actions-examples) repository.

## License

MIT. See [LICENSE](../LICENSE).
