# create-crs-pr-job-summary

A reusable GitHub Action to create a [GitHub Job Summary](https://github.blog/news-insights/product-news/supercharging-github-actions-with-job-summaries/) with CRs in a pull request.

## Usage

```yaml
- uses: cr-review-tools/crs-actions/create-crs-pr-job-summary@<ref>
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

No special permissions are required to write to the `$GITHUB_STEP_SUMMARY` variable in a GitHub Actions Workflow.

### Example Workflow

```yaml
name: Create CRs PR Job Summary

on:
  pull_request:
    branches: [main]

jobs:
  create-crs-pr-job-summary:
    runs-on: ubuntu-latest
    permissions:
      contents: read
    steps:
      - name: Checkout
        uses: actions/checkout@v4
      - name: Install crs
        uses: cr-review-tools/crs-actions/setup-crs@v1.0.0
        with:
          crs-version: 0.0.20250705
      - name: Create CRs PR Job Summary
        uses: cr-review-tools/crs-actions/create-crs-pr-job-summary@v1.0.0
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

### See it in action

Find a live workflow example for this action in the [crs-actions-examples](https://github.com/cr-review-tools/crs-actions-examples) repository.

## License

MIT. See [LICENSE](../LICENSE).
