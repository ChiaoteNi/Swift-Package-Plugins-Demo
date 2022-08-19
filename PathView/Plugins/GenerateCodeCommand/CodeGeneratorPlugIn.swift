//
//  File.swift
//
//
//  Created by Chiaote Ni on 2022/6/30.
//

import Foundation
import PackagePlugin

@main
struct CodeGeneratorPlugIn: CommandPlugin {

    func performCommand(
        context: PackagePlugin.PluginContext,
        arguments: [String]
    ) async throws {

        let inputFilePath = context.package.directory
            .appending(subpath: "Sources/Resources")
            .appending("DPaths.json")

        let outputDirectory = context.package.directory
            .appending(subpath: "Sources/PathViews")
        let outputFilePath = outputDirectory
            .appending("GeneratedView.swift")

        let executablePath = try context.tool(named: "CodeGenerator").path
        
        let generator = URL(fileURLWithPath: executablePath.string)
        let arguments = [
            inputFilePath.string,
            outputFilePath.string
        ]

        let process = try Process.run(generator, arguments: arguments)
        process.waitUntilExit()
    }
}
