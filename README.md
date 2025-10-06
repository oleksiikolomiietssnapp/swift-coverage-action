# Swift Coverage Action

A GitHub Actions workflow for generating Swift Package Manager test coverage reports with PR comments.

<div align="center">

[![Version](https://img.shields.io/github/v/tag/oleksiikolomiietssnapp/swift-coverage-action)](https://github.com/oleksiikolomiietssnapp/swift-coverage-action/tags)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![CI](https://img.shields.io/github/actions/workflow/status/oleksiikolomiietssnapp/swift-coverage-action/test-sample.yml?branch=main&label=tests&logo=github)](https://github.com/oleksiikolomiietssnapp/swift-coverage-action/actions)
[![SPM](https://img.shields.io/badge/SPM-Compatible-brightgreen.svg?logo=swift)](https://swift.org/package-manager/)
[![Platform](https://img.shields.io/badge/Platform-macOS-lightgrey.svg?logo=apple)](https://github.com/oleksiikolomiietssnapp/swift-coverage-action)

[![macOS](https://img.shields.io/badge/macOS-Configurable_(default:_latest)-blue.svg?logo=apple)](https://github.com/actions/runner-images)
[![Xcode](https://img.shields.io/badge/Xcode-Configurable_(default:_system)-blue.svg?logo=xcode)](https://developer.apple.com/xcode/)

</div>

## Quick Start

```yaml
name: Coverage
on: [push, pull_request]

jobs:
  test:
    permissions:
      contents: read
      pull-requests: write  # Required for PR comments
      issues: write         # Required for PR comments
    uses: oleksiikolomiietssnapp/swift-coverage-action/.github/workflows/swift-coverage.yml@main
```

## Configuration

```yaml
jobs:
  test:
    permissions:
      contents: read
      pull-requests: write
      issues: write
    uses: oleksiikolomiietssnapp/swift-coverage-action/.github/workflows/swift-coverage.yml@main
    with:
      macos-version: "latest"            # Optional, default: latest (also: "15", "14")
      xcode-version: "16.4"              # Optional, default: system default
      project-name-override: "MyProject" # Optional, default: repo name
      working-directory: "./my-package"  # Optional, default: root
      skip-label: "skip-coverage"        # Optional, default: skip-coverage
      post-comment: true                 # Optional, default: true (set false for combined comments)
```

## Skipping Workflow

Add the `skip-coverage` label (or custom label via `skip-label` input) to your PR to skip workflow execution. For example, for documentation-only changes.

**Note:** To re-enable the workflow after removing the label, push a new commit or close and reopen the PR. Manually re-running a skipped workflow will not work.

## Requirements

- Swift Package with `Package.swift`
- Swift Testing framework
- macOS runner (configurable, default: latest)
- Xcode (uses system default or specify version)

## Output Example

|   №  | Name | Executable Lines | Coverage |
|:----:|------|-----------------:|---------:|
| 1 | CoreLibrary | 58 | **89.66%** |
| 2 | UtilsLibrary | 77 | **49.35%** |

## Inputs

| Input | Default | Description |
|-------|---------|-------------|
| `macos-version` | `latest` | macOS runner version (`latest`, `15`, `14`, etc.) |
| `xcode-version` | system default | Xcode version (e.g., `16.4`, `15.2`) |
| `project-name-override` | repo name | Override project name |
| `working-directory` | `.` | Package directory |
| `coverage-comment-header` | `### 🛡️ Code Coverage Report` | PR comment header |
| `skip-label` | `skip-coverage` | PR label to skip workflow execution |
| `post-comment` | `true` | Post coverage comment (set `false` for combined comments) |

## Permissions

When using this workflow, you need to grant the following permissions:
- `contents: read` - Required to checkout code
- `pull-requests: write` - Required to post PR comments (only if `post-comment: true`)
- `issues: write` - Required to post PR comments (only if `post-comment: true`)

## License

MIT License - see [LICENSE](LICENSE) file.
