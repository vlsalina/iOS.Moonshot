//
//  CrewMemberView.swift
//  Moonshot
//
//  Created by Vincent Salinas on 8/21/22.
//

import SwiftUI

struct CrewMemberView: View {
    var crewMember: CrewMember?
    
    var body: some View {
        HStack {
            AsyncImage(
                url: URL(string: "https://raw.githubusercontent.com/twostraws/HackingWithSwift/main/SwiftUI/project8-files/Images/\(crewMember!.name!)%402x.jpg"),
                content: { image in
                    image.resizable()
                        .frame(maxWidth: (828 * 0.24), maxHeight: (600 * 0.24))
                        .aspectRatio(contentMode: .fit)
                        .cornerRadius(15)
                },
                placeholder: {
                    ProgressView()
                }
            )
            VStack(alignment: .leading, spacing: 10) {
                HStack {
                    Text(crewMember!.name!.capitalized)
                        .foregroundColor(.white)
                    Spacer()
                }
                HStack {
                    Text(crewMember!.role!.capitalized)
                        .foregroundColor(.white)
                    Spacer()
                }
                
            }
            .padding(.horizontal)
            .frame(minWidth: 150)
        }
    }
}

struct CrewMemberView_Previews: PreviewProvider {
    static var previews: some View {
        CrewMemberView()
    }
}
