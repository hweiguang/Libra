// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Libra",
    platforms: [.iOS(.v13)],
    products: [
        .library(
            name: "Libra",
            targets: ["Libra"]),
    ],
    targets: [
        .target(
            name: "Libra"),
        .testTarget(
            name: "LibraTests",
            dependencies: ["Libra"]),
    ]
)
