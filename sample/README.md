# Sample Multi-Target Swift Package

This is a sample Swift Package with **two targets** to demonstrate the Swift Coverage Action's ability to handle multiple targets and generate proper coverage reports.

## Package Structure

### Targets

1. **CoreLibrary** - Core mathematical operations and validation
   - `Calculator.swift` - Basic arithmetic operations
   - `MathValidator.swift` - Number validation utilities

2. **UtilsLibrary** - Utility functions that depend on CoreLibrary
   - `StringUtils.swift` - String manipulation utilities
   - `ArrayUtils.swift` - Array processing utilities

### Test Coverage

The tests are intentionally **incomplete** to demonstrate partial coverage:

- **CoreLibrary**: ~75% coverage (some edge cases not tested)
- **UtilsLibrary**: ~60% coverage (some functions not tested)

## Expected Coverage Report

When the action runs, you should see output like:

```
### 📊 Sample Multi-Target Coverage

|   №  | Name | Executable Lines | Coverage |
|:----:|------|-----------------:|---------:|
| 1 | CoreLibrary | 45 | **76.5%** |
| 2 | UtilsLibrary | 38 | **62.1%** |
```

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
- ✅ Realistic partial coverage scenarios
