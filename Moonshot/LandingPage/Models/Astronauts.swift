//
//  Astronauts.swift
//  Moonshot
//
//  Created by Vincent Salinas on 8/19/22.
//

import Foundation

struct Astronauts: Codable {
    var astronauts: [Astronaut]?
}

struct Astronaut: Codable, Identifiable {
    var id: String?
    var name: String?
    var description: String?
}

