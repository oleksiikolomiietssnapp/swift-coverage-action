# Swift Coverage Action

A reusable GitHub Actions workflow for generating Swift test coverage reports with PR comments.

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

## Features

- 🧪 Runs Swift tests with coverage enabled using **Swift Testing** framework
- 📊 Generates coverage reports in markdown table format
- 💬 Automatically comments on pull requests with coverage data
- 🔧 Configurable Xcode version, project name, and source paths
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
    uses: oleksiikolomiietssnapp/swift-coverage-action/.github/workflows/swift-coverage.yml@v0.1.0
```

### Advanced Usage

```yaml
jobs:
  coverage:
    uses: oleksiikolomiietssnapp/swift-coverage-action/.github/workflows/swift-coverage.yml@v0.1.0
    with:
      xcode-version: "16.2"
      project-name-override: "MyCustomProject"
      source-path-override: "MyProject/Sources"
      coverage-comment-header: "### 📊 Test Coverage"
```

### Version Pinning

**Recommended (stable):**
```yaml
uses: oleksiikolomiietssnapp/swift-coverage-action/.github/workflows/swift-coverage.yml@v0.1.0
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

## Outputs

| Output | Description |
|--------|-------------|
| `coverage-percentage` | The calculated coverage percentage |

## Project Compatibility

This workflow works with **any Swift project** that uses `swift test`:

### ✅ Swift Package Manager Projects (Default)
- Uses `{ProjectName}/Sources/` pattern automatically
- No configuration needed

### ✅ iOS/macOS App Projects
- Override source path to your app target folder
- Example: `source-path-override: "MyApp/MyApp"`

### ✅ Custom Project Structures
- Any folder structure with configurable path patterns
- Examples: `"Sources/Core"`, `"Modules/Feature"`, `"MyProject/Logic"`

### Examples by Project Type

**Swift Package:**
```yaml
uses: oleksiikolomiietssnapp/swift-coverage-action/.github/workflows/swift-coverage.yml@v0.1.0
# Uses default: {ProjectName}/Sources/
```

**iOS App:**
```yaml
uses: oleksiikolomiietssnapp/swift-coverage-action/.github/workflows/swift-coverage.yml@v0.1.0
with:
  source-path-override: "MyApp/MyApp"
```

**Multi-module project:**
```yaml
uses: oleksiikolomiietssnapp/swift-coverage-action/.github/workflows/swift-coverage.yml@v0.1.0
with:
  source-path-override: "Sources/Core"
```

## Requirements

- Any Swift project that supports `swift test`
- **Swift Testing framework** (works with latest version)
- macOS runner (uses Xcode)

## Setup

1. Add the workflow to your Swift project's `.github/workflows/` directory
2. Configure inputs as needed for your project structure
3. Push to trigger the workflow on your next PR or commit to main

## Contributing

This is an open-source project. Feel free to:
- Report issues
- Submit feature requests
- Contribute improvements via pull requests

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Example Output

The workflow generates a coverage table like this:

| ID | Name | Executable Lines | Coverage |
|----|------|-----------------:|---------:|
| 0 | MyProject | 150 | **87.33%** |
