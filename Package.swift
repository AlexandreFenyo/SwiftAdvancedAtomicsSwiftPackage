// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SwiftAdvancedAtomicsSwiftPackage",
    products: [
        .library(
            name: "SwiftAdvancedAtomicsSwiftPackage",
            targets: ["SwiftAdvancedAtomicsSwiftPackage"]),
        
    ],

    dependencies: [
            .package(name: "SwiftAdvancedAtomicsCPackage", path: "../SwiftAdvancedAtomicsCPackage"),
        ],

    targets: [
        .target(
            name: "SwiftAdvancedAtomicsSwiftPackage",
            dependencies: [
                "SwiftAdvancedAtomicsCPackage"
            ]),
        .testTarget(
            name: "SwiftAdvancedAtomicsSwiftPackageTests",
            dependencies: [
                "SwiftAdvancedAtomicsSwiftPackage"
            ]),
    ]
)
