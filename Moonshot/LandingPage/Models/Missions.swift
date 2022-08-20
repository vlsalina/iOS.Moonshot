//
//  Missions.swift
//  Moonshot
//
//  Created by Vincent Salinas on 8/19/22.
//

import Foundation

struct Mission: Codable, Identifiable {
    var id: Int?
    var launchDate: String?
    var crew: [CrewMember]?
    var description: String?
}

struct CrewMember: Codable {
    var name: String?
    var role: String?
}
