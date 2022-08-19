//
//  File.swift
//  
//
//  Created by Chiaote Ni on 2022/7/1.
//

import Foundation

public final class PathRetriever {

    private let jsonEncoder: JSONEncoder

    public init() {
        jsonEncoder = JSONEncoder()
    }

    public func retrieve(from url: URL) throws -> [DPath] {
        do {
            let data: Data = try fetchData(with: url)
            let dPaths: [DPath] = try decodeModel(with: data)
            return dPaths
        } catch {
            throw error
        }
    }
}

// MARK: Private functions
extension PathRetriever {

    private func fetchData(with url: URL) throws -> Data {
        do {
            return try Data(contentsOf: url)
        } catch {
            debugPrint("fetch data fail: ", error)
            throw error
        }
    }

    private func decodeModel<T: Decodable>(with data: Data) throws -> [T] {
        let decoder = JSONDecoder()
        do {
            return try decoder.decode([T].self, from: data)
        } catch {
            debugPrint("decode data fail: ", error)
            throw error
        }
    }
}
