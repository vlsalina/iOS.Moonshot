//
//  Missions.swift
//  Moonshot
//
//  Created by Vincent Salinas on 8/19/22.
//

import Foundation

struct Mission: Codable, Identifiable {
    var id: Int?
    var launchDate: Date?
    var crew: [CrewMember]?
    var description: String?
    
    var formattedLaunchDate: String {
        launchDate?.formatted(date: .abbreviated, time: .omitted) ?? "N/A"
    }
}

struct CrewMember: Codable {
    var name: String?
    var role: String?
}
