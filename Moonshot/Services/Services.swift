//
//  Services.swift
//  Moonshot
//
//  Created by Vincent Salinas on 8/19/22.
//

import Foundation

class Services: ObservableObject {
    @Published private(set) var missions = [Mission]()
    
    func decode(_ url: String) {
        let session = URLSession.shared
        let decoder = JSONDecoder()
        
        guard let jsonURL = URL(string: url) else {
            print("Invalid url")
            fatalError()
        }
        
        let task = session.dataTask(with: jsonURL) { data, response, error in
            if let error = error {
                print(error.localizedDescription)
                fatalError()
            }
            
            guard let data = try? Data(contentsOf: jsonURL) else {
                fatalError("Could not retrieve api data")
            }
            
            guard let jsonData = try? decoder.decode([Mission].self, from: data) else {
                fatalError("Could not decode json data")
            }
            
            DispatchQueue.main.async {
                self.missions = jsonData
            }
            
        }
        task.resume()
    }
}
