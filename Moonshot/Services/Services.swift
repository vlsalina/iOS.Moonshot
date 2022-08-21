//
//  Services.swift
//  Moonshot
//
//  Created by Vincent Salinas on 8/19/22.
//

import Foundation

class Services {
    
    static var shared = Services()
    
    func fetch<T: Codable>(_ url: String) async throws -> T {
        let urlObj = URL(string: url)!
        
        let (data, _) = try await URLSession.shared.data(from: urlObj)
        
        let decoder = JSONDecoder()
        let result = try decoder.decode(T.self, from: data)
        
        return result
    }

    
}

extension Bundle {
    func decode<T: Codable>(_ file: String) -> T {
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Failed to locate \(file) in bundle.")
        }

        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to load \(file) from bundle.")
        }

        let decoder = JSONDecoder()

        guard let loaded = try? decoder.decode(T.self, from: data) else {
            fatalError("Failed to decode \(file) from bundle.")
        }

        return loaded
    }
}
