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
        let formatter = DateFormatter()
        formatter.dateFormat = "y-MM-dd"
        decoder.dateDecodingStrategy = .formatted(formatter)
        
        let result = try decoder.decode(T.self, from: data)
        
        return result
    }

    
}

