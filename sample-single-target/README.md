# Single Target Sample

Minimal Swift Package with one target to demonstrate coverage reporting for simple projects.

## Structure

- **MyLibrary** - Math utilities (`add`, `multiply`, `divide`)
- **MyLibraryTests** - Partial test coverage (~70%)

## Purpose

Demonstrates:
- Single target coverage (no Total row in output)
- Threshold behavior with `coverage-threshold: "70"`
- Simple package structure

Used by `.github/workflows/test-sample-single-target.yml`.
