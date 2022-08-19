//
//  String + Regx.swift
//  
//
//  Created by Chiaote Ni on 2022/8/14.
//

import Foundation

public extension String {

    func matches(for regex: String) -> [NSTextCheckingResult] {
        do {
            let regex = try NSRegularExpression(pattern: regex)
            return regex.matches(in: self, range: NSRange.init(location: 0, length: count))
        } catch let error {
            print("invalid regex: \(error.localizedDescription)")
            return []
        }
    }

    func getMatchedTxts(for regex: String) -> [String] {
        let results: [NSTextCheckingResult] = matches(for: regex)
        let result = results.compactMap { String(self[Range($0.range, in: self)!]) }
        return result
    }
}
