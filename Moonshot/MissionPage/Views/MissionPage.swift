//
//  MissionPage.swift
//  Moonshot
//
//  Created by Vincent Salinas on 8/20/22.
//

import SwiftUI

struct MissionPage: View {
    @State var astronauts = [String: Astronaut]()
    
    var mission: Mission?
    
    var body: some View {
        GeometryReader { geometry in
            VStack(alignment: .leading) {
                ScrollView {
                    AsyncImage(
                        url: URL(string: "https://raw.githubusercontent.com/twostraws/HackingWithSwift/main/SwiftUI/project8-files/Images/apollo\(String(describing: mission!.id!))%403x.png"),
                        content: { image in
                            image.resizable()
                                .aspectRatio(contentMode: .fit)
                        },
                        placeholder: {
                            ProgressView()
                        }
                    )
                    VStack(alignment: .leading) {
                        Text("Mission")
                            .font(.title3)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .padding([.bottom], 5)
                        Text(mission!.description!)
                            .foregroundColor(.white)
                    }
                    
                    VStack(alignment: .leading) {
                        HStack {
                            Text("Crew")
                                .font(.title3)
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .padding([.bottom], 5)
                            Spacer()
                        }
                        ScrollView(.horizontal) {
                            LazyHStack {
                                ForEach(mission!.crew!, id: \.name) { crewMember in
                                    CrewMemberView(crewMember: crewMember)
                                }
                            }
                        }
                    }
                    .padding(.vertical)
                    
                    
                }
            }
            .padding(.horizontal)
            .background(.darkBackground)
            .task {
                do {
                    astronauts = try await Services.shared.fetch("https://raw.githubusercontent.com/twostraws/HackingWithSwift/main/SwiftUI/project8/Moonshot/astronauts.json")
                } catch {
                    print(error)
                }
            }
        }
    }
}

struct MissionPage_Previews: PreviewProvider {
    static var previews: some View {
        MissionPage()
    }
}
