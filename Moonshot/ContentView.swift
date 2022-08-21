//
//  ContentView.swift
//  Moonshot
//
//  Created by Vincent Salinas on 8/19/22.
//

import SwiftUI

struct ContentView: View {
    @State var missions = [Mission]()
    @State var astronauts = [String: Astronaut]()
    
    @State var showNextView = false
    @State var current: Mission?
    
    let cols = [GridItem(.adaptive(minimum: 150))]
    
    var body: some View {
        NavigationView {
            VStack {
                ScrollView {
                    LazyVGrid(columns: cols) {
                        ForEach(missions) { mission in
                            Button(action: {
                                current = mission
                                showNextView = true
                            }) {
                                MissionCard(mission: mission)
                            }
                        }
                    }
                }
            }
            .task {
                do {
                    astronauts = try await Services.shared.fetch("https://raw.githubusercontent.com/twostraws/HackingWithSwift/main/SwiftUI/project8/Moonshot/astronauts.json")
                    
                    missions = try await Services.shared.fetch("https://raw.githubusercontent.com/twostraws/HackingWithSwift/main/SwiftUI/project8-files/missions.json")
                    
                } catch {
                    print(error)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
