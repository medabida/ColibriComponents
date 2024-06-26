//  swift-tools-version: 5.7
//
//  Package.swift
//  ColibriComponents
//
//  Created by david-swift on 19.01.23.
//

import PackageDescription

/// The ColibriComponents package.
let package = Package(
    name: "ColibriComponents",
    platforms: [
        .macOS(.v12),
        .iOS(.v15)
    ],
    products: [
        .library(
            name: "ColibriComponents",
            targets: ["ColibriComponents"]
        )
    ],
    dependencies: [
        .package(url: "https://github.com/lukepistrol/SwiftLintPlugin", from: "0.55.1"),
        .package(url: "https://github.com/SFSafeSymbols/SFSafeSymbols", .upToNextMajor(from: "4.0.0"))
    ],
    targets: [
        .target(
            name: "ColibriComponents",
            dependencies: [.product(name: "SFSafeSymbols", package: "SFSafeSymbols")],
            plugins: [
                .plugin(name: "SwiftLint", package: "SwiftLintPlugin")
            ]
        ),
        .testTarget(
            name: "ColibriComponentsTests",
            dependencies: ["ColibriComponents"],
            plugins: [
                .plugin(name: "SwiftLint", package: "SwiftLintPlugin")
            ]
        )
    ]
)
