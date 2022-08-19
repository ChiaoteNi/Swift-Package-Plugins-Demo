//
//  File.swift
//  
//
//  Created by Chiaote Ni on 2022/8/14.
//

import Foundation

public extension Array {
    typealias E = Element

    subscript(safe index: Int) -> E? {
        guard index >= 0, index < count else { return nil }
        let element = self[index]
        return element
    }
}
