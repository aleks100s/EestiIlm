// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

private let package = Package(
    name: "Core",
    platforms: [.iOS(.v16)],
    products: [
        .library(
            name: "Core",
            targets: [
                "Domain",
                "Library"
            ]
        )
    ],
    targets: [
        .target(
            name: "Domain",
            dependencies: []
        ),
        .target(
            name: "Library",
            dependencies: ["Domain"]
        ),
        .testTarget(
            name: "CoreTests",
            dependencies: ["Domain"]
        )
    ]
)
