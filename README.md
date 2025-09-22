# Swift Coverage Action

A reusable GitHub Actions workflow for generating **Swift Testing** coverage reports for **Swift Package Manager** packages with PR comments.

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

## Features

- 🧪 Runs Swift tests with coverage enabled using **Swift Testing** framework
- 📊 Generates coverage reports in markdown table format with **multi-target support**
- 💬 Automatically comments on pull requests with coverage data
- 🎯 **Detects and reports coverage for each target separately** (Swift Package Manager)
- 🔧 Configurable Xcode version, project name, source paths, and working directory
- 📤 Outputs coverage percentage for use in other jobs
- ✅ **Compatible with latest Swift Testing library**

## Usage

📋 **For a complete usage example, see [usage-example.yml](usage-example.yml)**

### Basic Usage

```yaml
name: Test and Coverage

on:
  push:
    branches: [ "main" ]
  pull_request:
    branches: [ "main" ]

jobs:
  coverage:
    uses: oleksiikolomiietssnapp/swift-coverage-action/.github/workflows/swift-coverage.yml@0.1.1
```

### Advanced Usage

```yaml
jobs:
  coverage:
    uses: oleksiikolomiietssnapp/swift-coverage-action/.github/workflows/swift-coverage.yml@0.1.1
    with:
      xcode-version: "16.2"
      project-name-override: "MyCustomProject"
      source-path-override: "MyProject/Sources"
      coverage-comment-header: "### 📊 Test Coverage"
```

### Version Pinning

**Recommended (stable):**
```yaml
uses: oleksiikolomiietssnapp/swift-coverage-action/.github/workflows/swift-coverage.yml@0.1.1
```

**Latest (for testing):**
```yaml
uses: oleksiikolomiietssnapp/swift-coverage-action/.github/workflows/swift-coverage.yml@main
```

## Inputs

| Input | Description | Required | Default |
|-------|-------------|----------|---------|
| `xcode-version` | Xcode version to use | No | `16.2` |
| `source-path-override` | Override source path pattern for coverage filtering | No | `{PROJECT}/Sources` |
| `project-name-override` | Override project name | No | Repository name |
| `coverage-comment-header` | Header for coverage comment | No | `### 🛡️ Code Coverage Report` |
| `working-directory` | Working directory for Swift commands | No | `.` (repository root) |

## Outputs

| Output | Description |
|--------|-------------|
| `coverage-percentage` | The calculated coverage percentage |

## What This Action Is For

This workflow is specifically designed for:

- **Swift Package Manager packages** using Swift Testing framework
- **Packages with Apple framework dependencies** (requires macOS/Xcode)
- **Multi-target packages** with individual coverage reporting
- **Cross-platform Swift libraries** targeting Apple platforms

### ✅ Swift Package Manager Packages
- Uses `{ProjectName}/Sources/` pattern automatically
- Supports single and multi-target packages
- No configuration needed for standard SPM structure

### ✅ Custom SPM Package Structures
- Override source path patterns if needed
- Examples: `"Sources/Core"`, `"Modules/Feature"`, custom directories

### Examples by Package Type

**Standard Swift Package:**
```yaml
uses: oleksiikolomiietssnapp/swift-coverage-action/.github/workflows/swift-coverage.yml@0.1.1
# Uses default: {ProjectName}/Sources/
```

**Multi-target Swift Package:**
```yaml
uses: oleksiikolomiietssnapp/swift-coverage-action/.github/workflows/swift-coverage.yml@0.1.1
# Automatically detects and reports each target separately
```

**Custom SPM structure:**
```yaml
uses: oleksiikolomiietssnapp/swift-coverage-action/.github/workflows/swift-coverage.yml@0.1.1
with:
  source-path-override: "Sources/Core"
```

**Package in subdirectory:**
```yaml
uses: oleksiikolomiietssnapp/swift-coverage-action/.github/workflows/swift-coverage.yml@0.1.1
with:
  working-directory: "./my-swift-package"
```

## Requirements

- **Swift Package Manager package** with `Package.swift`
- **Swift Testing framework** for tests
- **macOS runner** (requires Xcode for Apple framework support)
- Package must support `swift test --enable-swift-testing --enable-code-coverage`

## Setup

1. Add the workflow to your Swift Package's `.github/workflows/` directory
2. Configure inputs as needed for your package structure
3. Push to trigger the workflow on your next PR or commit to main

## Contributing

This is an open-source project. Feel free to:
- Report issues
- Submit feature requests
- Contribute improvements via pull requests

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Example Output

The workflow generates coverage tables with automatic target detection:

### Single Target Project
|   №  | Name | Executable Lines | Coverage |
|:----:|------|-----------------:|---------:|
| 1 | MyProject | 150 | **87.33%** |

### Multi-Target Project (Swift Package Manager)
|   №  | Name | Executable Lines | Coverage |
|:----:|------|-----------------:|---------:|
| 1 | CoreLibrary | 58 | **89.66%** |
| 2 | UtilsLibrary | 77 | **49.35%** |

## Sample Multi-Target Package

This repository includes a complete [sample Swift Package](sample/) with multiple targets to demonstrate the action's multi-target capabilities. The sample shows realistic coverage scenarios with:

- **CoreLibrary** - Core mathematical operations (high coverage)
- **UtilsLibrary** - Utility functions with UIKit/AppKit dependencies (partial coverage)
- **Cross-platform code** - Demonstrates conditional compilation for iOS/macOS frameworks
- **Comprehensive tests** - Real-world testing patterns with platform-specific APIs

See the [sample README](sample/README.md) for details.
