// swift-tools-version: 5.9

import PackageDescription

let package = Package(
    name: "Features",
    platforms: [
        .iOS("16.0"),
    ],
    products: [
        .library(
            name: "Features",
            targets: [
                "Movies",
            ]
        ),
    ],
    dependencies: [
        .package(path: "../Infrastructure"),
        .package(url: "https://github.com/Quick/Nimble.git", from: "12.0.0"),
    ],
    targets: [
        .target(
            name: "Movies",
            dependencies: [
                "Infrastructure",
            ]
        ),
    ]
)
