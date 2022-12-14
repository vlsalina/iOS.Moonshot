//
//  MissionCard.swift
//  Moonshot
//
//  Created by Vincent Salinas on 8/20/22.
//

import SwiftUI

struct MissionCard: View {
    var mission: Mission
    
    var body: some View {
        VStack {
            AsyncImage(
                url: URL(string: "https://raw.githubusercontent.com/twostraws/HackingWithSwift/main/SwiftUI/project8-files/Images/apollo\(String(describing: mission.id!))%402x.png"),
                content: { image in
                    image.resizable()
                        .aspectRatio(contentMode: .fill)
                        .padding()
                },
                placeholder: {
                    ProgressView()
                }
            )
            VStack {
                Text("Apollo \(mission.id!)")
                    .font(.headline)
                    .foregroundColor(Color.white)
                Text(mission.formattedLaunchDate)
                    .font(.caption)
                    .foregroundColor(Color.white.opacity(0.5))
            }
            .padding(.vertical)
            .frame(maxWidth: .infinity)
            .background(.lightBackground)
        }
        .frame(minHeight: 250)
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .overlay(
            RoundedRectangle(cornerRadius: 10).stroke(.lightBackground)
        )
    }
}

//struct MissionCard_Previews: PreviewProvider {
//
//    static var previews: some View {
//        MissionCard()
//    }
//}
