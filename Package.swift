// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SwiftAdvancedAtomicsSwiftPackage",
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "SwiftAdvancedAtomicsSwiftPackage",
            targets: ["SwiftAdvancedAtomicsSwiftPackage"]),
        
    ],

    dependencies: [
            // Here we define our package's external dependencies
            // and from where they can be fetched:
            .package(name: "SwiftAdvancedAtomicsCPackage", path: "/Users/fenyo/git/SwiftAdvancedAtomicsCPackage"),
        ],


    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "SwiftAdvancedAtomicsSwiftPackage",
            dependencies: [
                "SwiftAdvancedAtomicsCPackage"
                          ]),
/*        .testTarget(
            name: "SwiftAdvancedAtomicsSwiftPackageTests",
            dependencies: ["SwiftAdvancedAtomicsSwiftPackage"]),*/
    ]
)
