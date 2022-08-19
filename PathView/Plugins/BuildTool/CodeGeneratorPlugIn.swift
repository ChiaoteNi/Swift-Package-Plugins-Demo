//
//  CodeGeneratorPlugIn.swift
//  
//
//  Created by Chiaote Ni on 2022/6/30.
//

import Foundation
import PackagePlugin

@main
struct CodeGeneratorPlugIn: BuildToolPlugin {
    /// - Parameters:
    ///   - context: You can get some information about the package to which the plugin is being applied,
    ///              pluginWorkDirectory, and a named command line executable tool
    ///   - target:  some information of the current target (name, directory, dependencies)
    /// - Returns: command to run during the build, you can return the build and prebuild commands here
    func createBuildCommands(
        context: PackagePlugin.PluginContext,
        target: PackagePlugin.Target
    ) async throws -> [PackagePlugin.Command] {

        /* Get input path From SourceFiles
        guard
            let target = target as? SourceModuleTarget,
            let input = target.sourceFiles
            .first(where: { $0.path.lastComponent == "DPaths.json" })?
            .path
        else {
            debugPrint("💥 Build fail, the target source not found, current source files: ", target.sourceFiles)
            exit(1)
        }
         */

        let executablePath = try context.tool(named: "ModelGenerator").path
        let input = context.package.directory
            .appending(subpath: "Sources/Resources/DPaths.json")

        /* Not allow to write file to the following path.
         It's because you won't have the permission with build tool plug-in:

        let output = context.package.directory
            .appending(subpath: "Sources/Resources")
         */
        let output = context.pluginWorkDirectory
            .appending("GeneratedSources/AutoGeneratedViews.swift")

        return [
            .buildCommand(
                displayName: "Generating code!!!",
                executable: executablePath,
                arguments: [input.string, output.string],
                inputFiles: [input],
                outputFiles: [output]
            )
        ]
    }
}