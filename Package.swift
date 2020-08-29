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
    dependencies: [
        .package(name: "ViewInspector", url: "https://github.com/nalexn/ViewInspector", from: "0.4.5")
    ],
    targets: [
        .target(
            name: "JoinedText",
            dependencies: []
        ),
        .testTarget(
            name: "JoinedTextTests",
            dependencies: ["JoinedText", "ViewInspector"]
        ),
    ]
)
