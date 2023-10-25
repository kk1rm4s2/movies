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
                "Movie",
            ]
        ),
    ],
    dependencies: [
        .package(path: "../Infrastructure"),
        .package(path: "../Domain"),
        .package(url: "https://github.com/Quick/Nimble.git", from: "12.0.0"),
    ],
    targets: [
        .target(
            name: "Movie",
            dependencies: [
                "Infrastructure",
                "Domain",
            ]
        ),
        .testTarget(
            name: "MovieTests",
            dependencies: [
                "Movie",
                "Nimble",
            ]
        ),
    ]
)
