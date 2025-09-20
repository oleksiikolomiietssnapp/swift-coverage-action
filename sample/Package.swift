// swift-tools-version: 6.0.3
import PackageDescription

let package = Package(
    name: "SampleMultiTarget",
    platforms: [
        .macOS(.v10_15),
        .iOS(.v13),
    ],
    products: [
        .library(
            name: "CoreLibrary",
            targets: ["CoreLibrary"]
        ),
        .library(
            name: "UtilsLibrary",
            targets: ["UtilsLibrary"]
        ),
    ],
    targets: [
        // Core library target
        .target(
            name: "CoreLibrary",
            dependencies: []
        ),

        // Utils library target
        .target(
            name: "UtilsLibrary",
            dependencies: ["CoreLibrary"]
        ),

        // Core library tests
        .testTarget(
            name: "CoreLibraryTests",
            dependencies: [
                "CoreLibrary"
            ]
        ),

        // Utils library tests
        .testTarget(
            name: "UtilsLibraryTests",
            dependencies: [
                "UtilsLibrary"
            ]
        ),
    ]
)
