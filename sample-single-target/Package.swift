// swift-tools-version: 6.0.3
import PackageDescription

let package = Package(
    name: "SingleTargetSample",
    platforms: [
        .macOS(.v10_15),
    ],
    products: [
        .library(
            name: "MyLibrary",
            targets: ["MyLibrary"]
        ),
    ],
    targets: [
        .target(
            name: "MyLibrary",
            dependencies: []
        ),
        .testTarget(
            name: "MyLibraryTests",
            dependencies: ["MyLibrary"]
        ),
    ]
)
