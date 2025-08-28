// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Package",
    platforms: [
        .iOS(.v15)
    ],
    products: [
        .library(
            name: "Package",
            targets: ["Package"]),
    ],
    dependencies: [
    ],
    targets: [
        .target(
            name: "AllSpm",
            dependencies: [
            ]
                
        )
    ]
)
