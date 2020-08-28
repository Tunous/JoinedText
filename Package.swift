// swift-tools-version:5.2

import PackageDescription

let package = Package(
    name: "JoinedText",
    platforms: [
        .iOS(.v13),
        .macOS(.v10_15)
    ],
    products: [
        .library(
            name: "JoinedText",
            targets: ["JoinedText"]
        ),
    ],
    targets: [
        .target(
            name: "JoinedText",
            dependencies: []
        ),
        .testTarget(
            name: "JoinedTextTests",
            dependencies: ["JoinedText"]
        ),
    ]
)
