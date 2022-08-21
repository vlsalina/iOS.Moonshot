//
//  ContentView.swift
//  Moonshot
//
//  Created by Vincent Salinas on 8/19/22.
//

import SwiftUI

struct ContentView: View {
    @State var missions = [Mission]()
    
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
                NavigationLink(destination: MissionPage(mission: current), isActive: $showNextView) {
                    EmptyView()
                }
            }
            .padding()
            .navigationTitle("Missions")
            .background(Color.darkBackground)
            .preferredColorScheme(.dark)
            .task {
                do {
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
