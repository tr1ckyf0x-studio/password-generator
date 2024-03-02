// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "pwgen",
    platforms: [.macOS(.v10_13)],
    products: [
        .executable(name: "pwgen", targets: ["pwgen"])
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-argument-parser", exact: "1.3.0")
    ],
    targets: [
        .executableTarget(
            name: "pwgen",
            dependencies: [
                .product(name: "ArgumentParser", package: "swift-argument-parser")
            ]
        )
    ]
)
