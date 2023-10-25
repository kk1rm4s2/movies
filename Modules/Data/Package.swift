// swift-tools-version: 5.9

import PackageDescription

let package = Package(
    name: "Data",
    platforms: [
        .iOS("16.0"),
    ],
    products: [
        .library(
            name: "Data",
            targets: [
                "Data",
            ]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/Quick/Nimble.git", from: "12.0.0"),
    ],
    targets: [
        .target(
            name: "Data"
        ),
    ]
)
