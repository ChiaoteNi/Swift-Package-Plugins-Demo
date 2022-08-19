// swift-tools-version:5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "PathView",
    platforms: [.macOS(.v12), .iOS(.v14)],
    products: [
        .library(name: "PathViews", targets: ["PathViews"]),
//        .plugin(name: "BuildTool", targets: ["BuildTool"]),
//        .plugin(name: "Command", targets: ["Command"]),
//        .executable(name: "CodeGenerator", targets: ["CodeGenerator"]),

//        // Can also do like this if needed
//        .library(name: "PathViews", targets: ["PathViews", "Extensions"]),
    ],
    targets: [
        // Main Target
        .target(
            name: "PathViews",
            plugins: [.plugin(name: "BuildTool")]
        ),

        // Plug-in for the main target
        .plugin(
            name: "GenerateCodeCommand",
            capability: ._command(
                intent: .custom(
                    verb: "Generate code",
                    description: "YA"
                ),
                permissions: [.writeToPackageDirectory(reason: "YA~")]
            ),
            dependencies: ["CodeGenerator"]
        ),
        .plugin(
            name: "BuildTool",
            capability: .buildTool(),
            dependencies: ["ModelGenerator", "Resources"]
        ),

        // Executable targets for Plug-in
        .executableTarget(
            name: "CodeGenerator",
            dependencies: ["Extensions", "DPath"]
        ),
        .executableTarget(
            name: "ModelGenerator",
            dependencies: ["Extensions", "DPath"]
        ),

        // Utils targets for executables
        .target(name: "DPath"),
        .target(name: "Extensions"),
        .target(name: "Resources")
    ]
)
