//
//  CodeMaker.swift
//  
//
//  Created by Chiaote Ni on 2022/7/1.
//

import Foundation
import Extensions
import DPath

final class CodeMaker {

    func makeCode(with path: DPath) -> String {
        let headPart = makeHeadPart(with: path.name)

        let commands = path.d_path.getMatchedTxts(for: "[MHVLZ][0-9 ]*")

        let result: (String, (Int, Int)?) = commands.reduce(
            into: (headPart, nil)
        ) { partialResult, command in

            guard let result = makePath(
                with: command,
                startWith: partialResult.1
            ) else {
                return
            }

            partialResult.0 += result.0
            partialResult.1 = result.1
        }
        let code = result.0 + makeTail()
        return code
    }
}

extension CodeMaker {

    private func makePath(with command: String, startWith startPoint: (Int, Int)?) -> (String, (Int, Int))? {
        guard let actionChar = command.first else { return nil }
        let action = String(actionChar)

        let points = command
            .getMatchedTxts(for: "[0-9]*")
            .compactMap { Int($0) }
        var code = "            "

        switch action {
        case "M":
            guard let x = points[safe: 0], let y = points[safe: 1] else { return nil }
            code += "path.move(to: CGPoint(x: \(x), y: \(y)))\n"
            return (code, (x, y))
        case "L":
            guard let x = points[safe: 0], let y = points[safe: 1] else { return nil }
            code += "path.addLine(to: CGPoint(x: \(x), y: \(y)))\n"
            return (code, (x, y))
        case "H":
            guard let x = points[safe: 0], let y = startPoint?.1 else { return nil }
            code += "path.addLine(to: CGPoint(x: \(x), y: \(y)))\n"
            return (code, (x, y))
        case "V":
            guard let x = startPoint?.0, let y = points[safe: 0] else { return nil }
            code += "path.addLine(to: CGPoint(x: \(x), y: \(y)))\n"
            return (code, (x, y))
        case "Z":
            guard let point = startPoint else { return nil }
            code += "path.closeSubpath()\n"
            return (code, point)
        default:
            return nil
        }
    }

    private func makeHeadPart(with name: String) -> String {
        """
        public struct \(name)View: View {
            public init() {}

            public var body: some View {
                Path { path in\n
        """
    }

    private func makeTail() -> String {
        """
                }
            }
        }
        """
    }
}
