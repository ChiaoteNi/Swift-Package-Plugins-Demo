import Foundation
import DPath

@main
class CodeGenerator {

    enum GeneratorError: Error {
        case incorrectArguments(_ message: String)
    }

    static func main() throws {
        let arguments = CommandLine.arguments
        let inputFileURL = URL(fileURLWithPath: arguments[1])
        let outputFileURL = URL(fileURLWithPath: arguments[2])

        let dPaths = try PathRetriever().retrieve(from: inputFileURL)
        let code = CodeMaker().makeCode(with: dPaths)

        let outputFilePath = outputFileURL.path
        FileManager.default.createFile(
            atPath: outputFilePath,
            contents: nil,
            attributes: nil
        )
        
        do {
            try code.write(to: outputFileURL, atomically: true, encoding: .utf8)
        } catch {
            debugPrint("💥export cpp file fail", error)
        }
    }
}
