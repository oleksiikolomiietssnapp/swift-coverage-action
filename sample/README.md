# Sample Multi-Target Swift Package

This is a sample Swift Package with **three targets** to demonstrate the Swift Coverage Action's ability to handle multiple targets and generate proper coverage reports.

## Package Structure

### Targets

1. **CoreLibrary** - Core mathematical operations and validation
   - `Calculator.swift` - Basic arithmetic operations
   - `MathValidator.swift` - Number validation utilities

2. **UtilsLibrary** - Utility functions that depend on CoreLibrary
   - `StringUtils.swift` - String manipulation utilities
   - `ArrayUtils.swift` - Array processing utilities
   - `FontUtils.swift` - Cross-platform font utilities (iOS/macOS)

3. **NetworkLibrary** - HTTP client utilities
   - `HTTPClient.swift` - URL building and status code parsing

### Test Coverage

The tests are intentionally **incomplete** to demonstrate quality thresholds:

- **CoreLibrary**: ~85% coverage (🟢 Good)
- **NetworkLibrary**: ~70% coverage (🟡 Acceptable)
- **UtilsLibrary**: ~50% coverage (🔴 Low)

## Test Workflows

This sample has two test workflows demonstrating different usage patterns:

### Single Job ([test-sample-single.yml](../.github/workflows/test-sample-single.yml))
- Runs one coverage job
- Automatically posts PR comment with coverage table
- Simplest setup for most projects

### Combined Multi-Config ([test-sample-combined.yml](../.github/workflows/test-sample-combined.yml))
- Runs multiple jobs (different macOS/Xcode versions)
- Combines results into one PR comment with separate sections
- Demonstrates advanced multi-configuration testing

## Running Tests

```bash
cd sample
swift test --enable-code-coverage
```

## Purpose

This sample demonstrates:
- ✅ Multiple target detection and reporting
- ✅ Proper target name extraction from file paths
- ✅ Individual coverage calculation per target
- ✅ Cross-target dependencies (UtilsLibrary uses CoreLibrary)
- ✅ Cross-platform compatibility (iOS/macOS) with UIKit/AppKit conditional compilation
- ✅ Real-world Swift Testing scenarios with platform-specific framework dependencies
- ✅ Realistic partial coverage scenarios