# Workflow Templates

Copy one of these that suits your needs to your repository's `.github/workflows/` directory.

## Available Templates

### [`minimal.yml`](minimal.yml)
Simplest setup - just works out of the box.

### [`basic.yml`](basic.yml)
Common options like Xcode version, threshold, etc.

### [`matrix.yml`](matrix.yml)
Test multiple Xcode/macOS versions. Each posts its own PR comment.

### [`combined.yml`](combined.yml)
Multiple jobs, single PR comment. All logic is inline - just copy and use.

## Version Pinning

Replace `@main` with a specific version tag for stability:
```yaml
uses: oleksiikolomiietssnapp/swift-coverage-action/workflow@latest
```
