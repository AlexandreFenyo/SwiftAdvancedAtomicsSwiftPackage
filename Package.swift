// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SwiftAdvancedAtomicsSwiftPackage",
    platforms: [.macOS(.v10_15), .iOS(.v13), .tvOS(.v13), .watchOS(.v6), .macCatalyst(.v13)],
    products: [
        .library(
            name: "SwiftAdvancedAtomicsSwiftPackage",
            targets: ["SwiftAdvancedAtomicsSwiftPackage"]),
    ],

    dependencies: [
            .package(name: "SwiftAdvancedAtomicsCPackage", path: "../SwiftAdvancedAtomicsCPackage"),
            .package(name: "iOSToolsMacros", path: "../iOSToolsMacros"),
        ],

    targets: [
        .target(
            name: "SwiftAdvancedAtomicsSwiftPackage",
            dependencies: [
                "SwiftAdvancedAtomicsCPackage",
                "iOSToolsMacros"
            ]),
        .testTarget(
            name: "SwiftAdvancedAtomicsSwiftPackageTests",
            dependencies: [
                "SwiftAdvancedAtomicsSwiftPackage",
                "iOSToolsMacros"
            ]),
    ]
)
