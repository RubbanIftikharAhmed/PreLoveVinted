// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "VintedBackend",
    platforms: [
        .macOS(.v13)
    ],
    dependencies: [
        .package(url: "https://github.com/httpswift/swifter.git", from: "1.5.0")
    ],
    targets: [
        .target(
            name: "Models",
            path: "Models"
        ),
        .executableTarget(
            name: "VintedBackend",
            dependencies: [
                .product(name: "Swifter", package: "swifter"),
                "Models"
            ],
            path: "Sources"
        )
    ]
)


