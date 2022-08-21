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
                        .aspectRatio(contentMode: .fit)
                },
                placeholder: {
                    ProgressView()
                }
            )
            Text("Apollo \(mission.id!)")
        }
    }
}

//struct MissionCard_Previews: PreviewProvider {
//
//    static var previews: some View {
//        MissionCard()
//    }
//}
