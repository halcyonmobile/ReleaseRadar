// swift-tools-version:4.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ReleaseRadar",
    products: [
        .library(name: "ReleaseRadar", targets: ["ReleaseRadar"]),
        .executable(name: "Example", targets: ["Example"]),
    ],
    targets: [
        .target(name: "ReleaseRadar", dependencies: []),
        .target(name: "Example", dependencies: ["ReleaseRadar"]),
        .testTarget(name: "ReleaseRadarTests", dependencies: ["ReleaseRadar"]),
    ]
)
