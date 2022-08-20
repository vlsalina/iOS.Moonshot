//
//  ContentView.swift
//  Moonshot
//
//  Created by Vincent Salinas on 8/19/22.
//

import SwiftUI

struct ContentView: View {
    @State var missions = [Mission]()
    
    var body: some View {
        VStack {
            ScrollView {
                LazyVStack {
                    ForEach(missions) { mission in
                        Text(mission.description!)
                    }
                }
            }
        }
        .task {
            do {
                missions = try await Services.shared.fetch("https://raw.githubusercontent.com/twostraws/HackingWithSwift/main/SwiftUI/project8-files/missions.json")
            } catch {
                print(error)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
