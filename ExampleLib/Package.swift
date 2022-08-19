// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ExampleLib",
    platforms: [.iOS(.v14)],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "ExampleLib",
            targets: ["ExampleLib"]
        ),
    ],
    dependencies: [
        .package(
            name: "PathViews",
            path: "../PathView"
        ),
//        .package(
//            name: "PathViews",
//            url: "https://aaronni19@bitbucket.org/aaronni19/pathview.git",
//            branch: "feat/simple-demo"
//        ),
//        .package(
//            name: "PathViews",
//            url: "https://aaronni19@bitbucket.org/aaronni19/pathview.git",
//            from: "1.0.0"
//        ),
//        .package(name: "NTPClient", url: "git@github.com:ChiaoteNi/NTPClient.git", .revision("4a3cf7f9fa734b2c5ac0a8418016df0169e39a1e"))
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "ExampleLib",
            dependencies: [
                .product(name: "PathViews", package: "PathViews", condition: .none)
            ])
    ]
)
