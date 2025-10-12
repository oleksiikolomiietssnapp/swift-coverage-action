# Workflow Templates

Copy these to your repository's `.github/workflows/` directory.

## Available Templates

### [`minimal.yml`](minimal.yml)
The simplest setup - just works out of the box.

### [`basic.yml`](basic.yml)
Common configuration options like Xcode version, threshold, etc.

### [`matrix.yml`](matrix.yml)
Test multiple Xcode/macOS versions. Each posts its own PR comment.

### [`combined.yml`](combined.yml)
Multiple jobs, single PR comment. Requires additional setup:

1. Copy this workflow to `.github/workflows/combined.yml`
2. Create `.github/scripts/post-combined-comment.js` in your repo:

```javascript
module.exports = async ({github, context, jobOutputs}) => {
  const sections = jobOutputs
    .filter(job => job.name && job.coverage)
    .map(job => `### ${job.name} - ${job.coverage}%\n\n${job.table}\n`);

  if (sections.length === 0) return;

  const commentMarker = '<!-- swift-coverage-combined -->';
  const comment = `## 📊 Combined Coverage\n\n${sections.join('\n')}${commentMarker}`;

  const comments = await github.rest.issues.listComments({
    owner: context.repo.owner,
    repo: context.repo.repo,
    issue_number: context.payload.pull_request.number,
  });

  const oldComments = comments.data.filter(c => c.body.includes(commentMarker));
  for (const c of oldComments) {
    await github.rest.issues.deleteComment({
      owner: context.repo.owner,
      repo: context.repo.repo,
      comment_id: c.id,
    });
  }

  await github.rest.issues.createComment({
    issue_number: context.payload.pull_request.number,
    owner: context.repo.owner,
    repo: context.repo.repo,
    body: comment,
  });
};
```

## Version Pinning

Replace `@main` with a specific version tag for stability:
```yaml
uses: oleksiikolomiietssnapp/swift-coverage-action/.github/workflows/swift-coverage.yml@0.1.0
```
