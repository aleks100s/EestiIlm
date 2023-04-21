// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

private let package = Package(
    name: "Network",
    platforms: [.iOS(.v16)],
    products: [
        .library(
            name: "Network",
            targets: [
                "DTO",
                "APIService",
                "APIServiceImpl",
                "FakeAPIServiceImpl"
            ]
        )
    ],
    dependencies: [
        .package(path: "Core")
    ],
    targets: [
        .target(
            name: "DTO",
            dependencies: ["Core"],
            resources: [
                .process("Resources")
            ]
        ),
        .target(
            name: "APIService",
            dependencies: ["Core"]
        ),
        .target(
            name: "APIServiceImpl",
            dependencies: ["APIService", "Core"]
        ),
        .target(
            name: "FakeAPIServiceImpl",
            dependencies: ["APIService", "Core"]
        ),
        .testTarget(
            name: "NetworkTests",
            dependencies: ["DTO"]
        )
    ]
)
