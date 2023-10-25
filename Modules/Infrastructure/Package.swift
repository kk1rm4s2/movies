// swift-tools-version: 5.9

import PackageDescription

let package = Package(
    name: "Infrastructure",
    platforms: [
        .iOS("16.0"),
    ],
    products: [
        .library(
            name: "Infrastructure",
            targets: [
                "Infrastructure",
            ]
        ),
    ],
    targets: [
        .target(
            name: "Infrastructure"
        ),
    ]
)
