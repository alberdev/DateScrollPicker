// swift-tools-version: 5.6

import PackageDescription

let PackageName = "DateScrollPicker"

let package = Package(
    name: PackageName,
    platforms: [.iOS(.v10)],
    products: [
        .library(
            name: PackageName,
            targets: [PackageName]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: PackageName,
            dependencies: [],
            path: PackageName,
            resources: [.process("Resources")],
            swiftSettings: [.define("SPM")]),
    ]
)
