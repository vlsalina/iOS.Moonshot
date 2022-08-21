//
//  CrewMemberPage.swift
//  Moonshot
//
//  Created by Vincent Salinas on 8/21/22.
//

import SwiftUI

struct CrewMemberPage: View {
    @State var astronauts = [String: Astronaut]()
    var crewMember: Astronaut?
    
    var body: some View {
        VStack {
            ScrollView {
                AsyncImage(
                    url: URL(string: "https://github.com/twostraws/HackingWithSwift/blob/main/SwiftUI/project8-files/Images/\(crewMember!.id!)@3x.jpg?raw=true"),
                    content: { image in
                        image.resizable()
                            .aspectRatio(contentMode: .fit)
                    },
                    placeholder: {
                        ProgressView()
                    }
                )
                Section {
                    Text(crewMember!.description!)
                        .foregroundColor(.white)
                }
                .padding()
            }
        }
        .background(.darkBackground)
        .navigationTitle(crewMember!.name!)
        .task {
            do {
                astronauts = try await Services.shared.fetch("https://raw.githubusercontent.com/twostraws/HackingWithSwift/main/SwiftUI/project8/Moonshot/astronauts.json")
            } catch {
                print(error)
            }
        }
        
    }
}

struct CrewMemberPage_Previews: PreviewProvider {
    static var previews: some View {
        CrewMemberPage()
    }
}
