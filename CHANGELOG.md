# Changelog

All notable changes to this project are documented here.

## [0.1.9] - 2025-10-28

### Added
- Console output for coverage data in workflow logs
- Coverage summary visible for all workflow types (PR comments and direct pushes)

### Changed
- Rename "Extract Coverage Data" step to "Process Coverage Data" for clarity
- Simplify console output format to bullet-list for better readability

### Documentation
- Add Permissions section to README clarifying public vs private repo requirements
- Create CHANGELOG.md with complete version history

## [0.1.8] - 2024-10-28

### Changed
- Moved sample projects to separate repository: [swift-coverage-action-samples](https://github.com/oleksiikolomiietssnapp/swift-coverage-action-samples)
- Removed sample and test workflow files

## [0.1.6] - 2024-10-14

### Added
- Coverage quality indicators: ✅ (pass) or ⚠️ (fail) based on threshold
- `coverage-threshold` input to enable visual indicators
- `fail-on-low-coverage` input to make job fail if threshold not met
- Details section showing what thresholds mean
- Enhanced Xcode version validation with helpful error messages
- Total row in coverage table (only when multiple targets exist)

### Improved
- Job isolation: each job only deletes its own previous PR comments

## [0.1.5] - 2024-10-12

### Added
- Unique job identifiers using `job-name` input
- `post-coverage-comment.js` script for comment management
- `test-post-combined-coverage-comment.js` for combined report testing

### Improved
- PR comment management with isolated deletion (HTML markers)
- Support for simultaneous matrix job comments without conflicts

## [0.1.4] - 2024-10-10

### Added
- Configurable macOS version: `macos-version` input (default: latest)
- Multi-job combined coverage comments via `post-comment: false`
- New outputs: `coverage-table`, `job-name`, `coverage-percentage`
- Test sample workflows: single and combined patterns

### Improved
- Documentation with concise configuration examples

## [0.1.2] - 2024-10-08

### Added
- Support for Swift 6.1 / Xcode 16.3
- Simplified README with professional badges

## [0.1.1] - 2024-10-07

### Improved
- README documentation

## [0.1.0] - 2024-10-06

### Added
- Initial release
- Automated code coverage reporting for Swift packages
- PR comment support
- Configurable threshold and Xcode version
