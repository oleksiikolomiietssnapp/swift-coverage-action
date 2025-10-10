# Swift Coverage Action

A GitHub Actions workflow for generating Swift Package Manager test coverage reports with PR comments.

<div align="center">

[![Version](https://img.shields.io/github/v/tag/oleksiikolomiietssnapp/swift-coverage-action)](https://github.com/oleksiikolomiietssnapp/swift-coverage-action/tags)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![CI](https://img.shields.io/github/actions/workflow/status/oleksiikolomiietssnapp/swift-coverage-action/test-samples.yml?branch=main&label=tests&logo=github)](https://github.com/oleksiikolomiietssnapp/swift-coverage-action/actions)
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
      # Environment
      macos-version: "latest"            # Optional: "latest", "15", "14"
      xcode-version: "16.4"              # Optional: specific version or system default
      working-directory: "./my-package"  # Optional: defaults to root

      # Project settings
      project-name-override: "MyProject" # Optional: defaults to repo name
      skip-label: "skip-coverage"        # Optional: PR label to skip execution

      # PR comments
      post-comment: true                 # Optional: false for multi-job combined comments
      job-name: "Configuration Name"     # Optional: used in combined comments
      coverage-comment-header: "### 📊 Coverage" # Optional: custom header

      # Quality threshold
      coverage-threshold: "80"           # Optional: enables ✅/⚠️ indicators when set
      fail-on-low-coverage: false        # Optional: fail job if below threshold
```

See [sample workflows](.github/workflows) for examples:
- `test-sample-single-target.yml` - Single target package
- `test-sample-single.yml` - Multiple targets package
- `test-sample-matrix.yml` - Matrix strategy (multiple configurations)
- `test-sample-combined.yml` - Combined multi-job reporting

## Skipping Workflow

Add the `skip-coverage` label (or custom label via `skip-label` input) to your PR to skip workflow execution. For example, for documentation-only changes.

**Note:** To re-enable the workflow after removing the label, push a new commit or close and reopen the PR. Manually re-running a skipped workflow will not work.

## Requirements

- Swift Package with `Package.swift`
- Swift Testing framework
- macOS runner (configurable, default: latest)
- Xcode (uses system default or specify version)

## Output Examples

<details>
<summary><b>Basic Coverage (no threshold)</b></summary>

|   №  | Target | Lines | Coverage |
|:----:|--------|------:|---------:|
| 1 | CoreLibrary | 58 | **85.66%** |
| 2 | NetworkLibrary | 35 | **70.00%** |
| 3 | UtilsLibrary | 77 | **49.35%** |
| | <p align="right">**Total**</p> | 170 | **68.34%** |

</details>

<details>
<summary><b>With Threshold - Passing (coverage-threshold: "80")</b></summary>

When threshold is met, header shows ✅:

|   №  | Target | Lines | ✅ |
|:----:|--------|------:|:---------:|
| 1 | CoreLibrary | 58 | **92.00%** |
| 2 | NetworkLibrary | 35 | **85.00%** |
| 3 | UtilsLibrary | 77 | **81.00%** |
| | <p align="right">**Total**</p> | 170 | **86.00%** |

<details>
<summary><b>Details</b></summary>

### Threshold - 80%
  - ⚠️ below
  - ✅ meets

</details>

</details>

<details>
<summary><b>With Threshold - Failing (coverage-threshold: "80")</b></summary>

When threshold is not met, header shows ⚠️:

|   №  | Target | Lines | ⚠️ |
|:----:|--------|------:|:---------:|
| 1 | CoreLibrary | 58 | **85.66%** |
| 2 | NetworkLibrary | 35 | **70.00%** |
| 3 | UtilsLibrary | 77 | **49.35%** |
| | <p align="right">**Total**</p> | 170 | **68.34%** |

<details>
<summary><b>Details</b></summary>

### Threshold - 80%
  - ⚠️ below
  - ✅ meets

</details>

</details>

<details>
<summary><b>Single Target Package</b></summary>

For packages with one target, no Total row is shown:

|   №  | Target | Lines | Coverage |
|:----:|--------|------:|---------:|
| 1 | MyLibrary | 45 | **73.33%** |

</details>

## PR Comment Management

Each job posts a uniquely identified comment that **only deletes its own previous comments**. Multiple jobs (e.g., matrix configurations) can post comments simultaneously without interfering with each other.

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
| `coverage-threshold` | _(empty)_ | Coverage threshold (e.g., `"80"`). When set, enables quality indicators |
| `fail-on-low-coverage` | `false` | Fail the job if coverage is below threshold |

## Permissions

When using this workflow, you need to grant the following permissions:
- `contents: read` - Required to checkout code
- `pull-requests: write` - Required to post PR comments (only if `post-comment: true`)
- `issues: write` - Required to post PR comments (only if `post-comment: true`)

## License

MIT License - see [LICENSE](LICENSE) file.
