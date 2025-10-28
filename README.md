# Swift Coverage Action

<div align="center">

[![Release](https://img.shields.io/github/v/release/oleksiikolomiietssnapp/swift-coverage-action)](https://github.com/oleksiikolomiietssnapp/swift-coverage-action/releases)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![CI](https://img.shields.io/github/actions/workflow/status/oleksiikolomiietssnapp/swift-coverage-action/test-samples.yml?branch=main&label=tests&logo=github)](https://github.com/oleksiikolomiietssnapp/swift-coverage-action/actions)
[![SPM](https://img.shields.io/badge/SPM-Compatible-brightgreen.svg?logo=swift)](https://swift.org/package-manager/)
[![Platform](https://img.shields.io/badge/Platform-macOS-lightgrey.svg?logo=apple)](https://github.com/oleksiikolomiietssnapp/swift-coverage-action)

[![macOS](https://img.shields.io/badge/macOS-Configurable_(default:_latest)-blue.svg?logo=apple)](https://github.com/actions/runner-images)
[![Xcode](https://img.shields.io/badge/Xcode-Configurable_(default:_system)-blue.svg?logo=xcode)](https://developer.apple.com/xcode/)

</div>

## What It Does

Automated code coverage reporting for Swift packages

```
┌───────┐      ┌───────┐      ┌─────────┐
│ Setup │ ───▶ │ Tests │ ───▶ │ Analyze │
└───────┘      └───────┘      └─────────┘
                                    │
                                    │
                                    ▼
                              ┌────────┐
                              │ Report │
                              └────────┘
```

<img width="917" alt="Example PR comment" src="https://github.com/user-attachments/assets/ec96651d-c42c-4633-9c8c-1931b46cb949" />

</div>

## Quick Start

```yaml
name: Coverage

on:
  push:
    branches: [ "main" ]
  pull_request:
    branches: [ "main" ]

jobs:
  coverage:
    uses: oleksiikolomiietssnapp/swift-coverage-action@latest
```

Permissions are inherited automatically when needed.

## Templates

Check out [`templates/`](templates/) for ready-to-use examples:
- [`minimal.yml`](templates/minimal.yml) - Simplest setup
- [`basic.yml`](templates/basic.yml) - Common options
- [`matrix.yml`](templates/matrix.yml) - Multiple Xcode/macOS versions
- [`combined.yml`](templates/combined.yml) - Multi-job, single comment

## Configuration

```yaml
uses: oleksiikolomiietssnapp/swift-coverage-action@latest
with:
  # Environment
  macos-version: "latest"            # "latest", "15", "14", etc.
  xcode-version: "16.4"              # Specific version or system default
  working-directory: "./my-package"  # Defaults to repo root

  # PR comments
  coverage-comment-header: "### 📊 Coverage"
  post-comment: true                 # Set false for combined multi-job comments
  job-name: "Config Name"            # Identifier for combined reports

  # Quality
  coverage-threshold: "80"           # Enables ✅/⚠️ indicators
  fail-on-low-coverage: false        # Fail job if below threshold
```

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

## All Inputs

| Input | Default | Description |
|-------|---------|-------------|
| `macos-version` | `latest` | macOS runner: `latest`, `15`, `14` |
| `xcode-version` | system default | Xcode version: `16.4`, `15.2` |
| `working-directory` | `.` | Package directory |
| `project-name-override` | repo name | Override project name |
| `skip-label` | `skip-coverage` | PR label to skip execution |
| `post-comment` | `true` | Post PR comment (`false` for combined) |
| `job-name` | _(empty)_ | Job identifier for combined reports |
| `coverage-comment-header` | `### 🛡️ Code Coverage Report` | PR comment header |
| `coverage-threshold` | _(empty)_ | Threshold % (enables ✅/⚠️) |
| `fail-on-low-coverage` | `false` | Fail if below threshold |

## Permissions

**Required for private repositories** to post PR comments:

```yaml
permissions:
  contents: read
  pull-requests: write
```

- `contents: read` - Checkout code and read coverage data
- `pull-requests: write` - Post and update PR comments

**Public repositories** typically don't require explicit permission declaration (GitHub's default permissions are sufficient).

If PR comments fail with a 403 error, add the permissions block above.

## Changelog

See [CHANGELOG.md](CHANGELOG.md) for version history and release notes.

## License

MIT License - see [LICENSE](LICENSE) file.
