// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

private let package = Package(
    name: "ForecastFlow",
    defaultLocalization: "en",
    platforms: [.iOS(.v16)],
    products: [
        .library(
            name: "ForecastFlow",
            targets: [
                "ForecastScene",
                "CityWeatherScene"
            ]
        )
    ],
    dependencies: [
        .package(path: "DesignSystem"),
        .package(path: "Core"),
        .package(path: "Network")
    ],
    targets: [
        .target(
            name: "ForecastScene",
            dependencies: [
                "DesignSystem",
                "Core",
                "Network"
            ],
            resources: [.process("Resources/Localizations")]
        ),
        .target(
            name: "CityWeatherScene",
            dependencies: [
                "DesignSystem",
                "Core"
            ],
            resources: [.process("Resources/Localizations")]
        ),
        .testTarget(
            name: "ForecastFlowTests",
            dependencies: [
                "ForecastScene",
                "CityWeatherScene"
            ]
        )
    ]
)
