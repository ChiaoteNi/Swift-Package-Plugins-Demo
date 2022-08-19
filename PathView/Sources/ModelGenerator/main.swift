//
//  File.swift
//  
//
//  Created by Chiaote Ni on 2022/8/14.
//

import Foundation
import DPath

let arguments = ProcessInfo().arguments
if arguments.count < 3 {
    print("missing arguments", arguments)
    exit(1)
}

var code = """
import Foundation
import SwiftUI
"""

let input = URL(fileURLWithPath: arguments[1], isDirectory: false)
let output = URL(fileURLWithPath: arguments[2])

try PathRetriever()
    .retrieve(from: input)
    .reduce(code, { partialResult, path in
        partialResult + "\n" + CodeMaker().makeCode(with: path)
    })
    .write(
        to: output,
        atomically: false,
        encoding: .utf8
    )
