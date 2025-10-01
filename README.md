# Swift Coverage Action

A GitHub Actions workflow for generating Swift Package Manager test coverage reports with PR comments.

<div align="center">

[![Version](https://img.shields.io/badge/Version-0.1.1-blue.svg)](https://github.com/oleksiikolomiietssnapp/swift-coverage-action/releases)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![CI](https://img.shields.io/github/actions/workflow/status/oleksiikolomiietssnapp/swift-coverage-action/test-sample.yml?branch=main&label=tests&logo=github)](https://github.com/oleksiikolomiietssnapp/swift-coverage-action/actions)
[![SPM](https://img.shields.io/badge/SPM-Compatible-brightgreen.svg?logo=swift)](https://swift.org/package-manager/)
[![Platform](https://img.shields.io/badge/Platform-macOS-lightgrey.svg?logo=apple)](https://github.com/oleksiikolomiietssnapp/swift-coverage-action)

[![Xcode](https://img.shields.io/badge/Xcode-Configurable_(default:_16.3)-blue.svg?logo=xcode)](https://developer.apple.com/xcode/)
[![Swift](https://img.shields.io/badge/Swift-Configurable_(default:_6.1)-orange.svg?logo=swift)](https://swift.org)

</div>

## Quick Start

```yaml
name: Coverage
on: [push, pull_request]

jobs:
  test:
    uses: oleksiikolomiietssnapp/swift-coverage-action/.github/workflows/swift-coverage.yml@main
```

## Configuration

```yaml
jobs:
  test:
    uses: oleksiikolomiietssnapp/swift-coverage-action/.github/workflows/swift-coverage.yml@main
    with:
      xcode-version: "16.3"              # Optional, default: 16.3 (Swift 6.1)
      project-name-override: "MyProject" # Optional, default: repo name
      working-directory: "./my-package"  # Optional, default: root
      skip-label: "skip-coverage"        # Optional, default: skip-coverage
```

## Skipping Workflow

Add the `skip-coverage` label (or custom label via `skip-label` input) to your PR to skip workflow execution. For example, for documentation-only changes.

**Note:** To re-enable the workflow after removing the label, push a new commit or close and reopen the PR. Manually re-running a skipped workflow will not work.

## Requirements

- Swift Package with `Package.swift`
- Swift Testing framework
- macOS runner (needs Xcode)
- Swift version depends on Xcode version (default: Swift 6.1 with Xcode 16.3)

## Output Example

|   №  | Name | Executable Lines | Coverage |
|:----:|------|-----------------:|---------:|
| 1 | CoreLibrary | 58 | **89.66%** |
| 2 | UtilsLibrary | 77 | **49.35%** |

## Inputs

| Input | Default | Description |
|-------|---------|-------------|
| `xcode-version` | `16.3` | Xcode version (determines Swift version) |
| `project-name-override` | repo name | Override project name |
| `working-directory` | `.` | Package directory |
| `coverage-comment-header` | `### 🛡️ Code Coverage Report` | PR comment header |
| `skip-label` | `skip-coverage` | PR label to skip workflow execution |

## License

MIT License - see [LICENSE](LICENSE) file.
