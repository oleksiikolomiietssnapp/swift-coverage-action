# Swift Coverage Reusable Workflow

A reusable GitHub Actions workflow for generating Swift test coverage reports with PR comments.

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
    uses: "oleksiikolomiietssnapp/swift-coverage-action/.github/workflows/swift-coverage.yml@main"
```

### Advanced Usage

```yaml
jobs:
  coverage:
    uses: "oleksiikolomiietssnapp/swift-coverage-action/.github/workflows/swift-coverage.yml@main"
    with:
      xcode-version: "16.2"
      project-name-override: "MyCustomProject"
      source-path-override: "MyProject/Sources"
      coverage-comment-header: "### 📊 Test Coverage"
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
uses: "oleksiikolomiietssnapp/swift-coverage-action/.github/workflows/swift-coverage.yml@main"
# Uses default: {ProjectName}/Sources/
```

**iOS App:**
```yaml
uses: "oleksiikolomiietssnapp/swift-coverage-action/.github/workflows/swift-coverage.yml@main"
with:
  source-path-override: "MyApp/MyApp"
```

**Multi-module project:**
```yaml
uses: "oleksiikolomiietssnapp/swift-coverage-action/.github/workflows/swift-coverage.yml@main"
with:
  source-path-override: "Sources/Core"
```

## Requirements

- Any Swift project that supports `swift test`
- **Swift Testing framework** (works with latest version)
- macOS runner (uses Xcode)

## Setup

1. Create a public repository for your reusable workflows
2. Add the `swift-coverage.yml` file to `.github/workflows/`
3. Tag a release or use `@main` for latest version
4. Reference in other repositories using the `uses` syntax

## Example Output

The workflow generates a coverage table like this:

| ID | Name | Executable Lines | Coverage |
|----|------|-----------------:|---------:|
| 0 | MyProject | 150 | **87.33%** |
