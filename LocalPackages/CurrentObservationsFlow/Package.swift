// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

private let package = Package(
    name: "CurrentObservationsFlow",
    defaultLocalization: "en",
    platforms: [.iOS(.v16)],
    products: [
        .library(
            name: "CurrentObservationsFlow",
            targets: [
                "CurrentObservationsScene",
                "ObservationScene"
            ]
        )
    ],
    dependencies: [
        .package(path: "Core"),
        .package(path: "DesignSystem"),
        .package(path: "Network")
    ],
    targets: [
        .target(
            name: "CurrentObservationsScene",
            dependencies: [
                "Core",
                "ObservationScene",
                "Network"
            ]
        ),
        .target(
            name: "ObservationScene",
            dependencies: [
                "Core",
                "DesignSystem"
            ],
            resources: [
                .process("Resources/Localizations")
            ]
        ),
        .testTarget(
            name: "CurrentObservationsFlowTests",
            dependencies: [
                "CurrentObservationsScene",
                "ObservationScene",
                "Network",
                "Core"
            ]
        )
    ]
)
