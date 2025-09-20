// swift-tools-version: 5.9
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
            targets: ["CoreLibrary"]),
        .library(
            name: "UtilsLibrary",
            targets: ["UtilsLibrary"]),
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-testing.git", from: "0.12.0"),
    ],
    targets: [
        // Core library target
        .target(
            name: "CoreLibrary",
            dependencies: []),

        // Utils library target
        .target(
            name: "UtilsLibrary",
            dependencies: ["CoreLibrary"]),

        // Core library tests
        .testTarget(
            name: "CoreLibraryTests",
            dependencies: [
                "CoreLibrary",
                .product(name: "Testing", package: "swift-testing")
            ]),

        // Utils library tests
        .testTarget(
            name: "UtilsLibraryTests",
            dependencies: [
                "UtilsLibrary",
                .product(name: "Testing", package: "swift-testing")
            ]),
    ]
)