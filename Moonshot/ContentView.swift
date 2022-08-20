//
//  ContentView.swift
//  Moonshot
//
//  Created by Vincent Salinas on 8/19/22.
//

import SwiftUI

struct ContentView: View {
    @StateObject var services = Services()
    
    var body: some View {
        VStack {
            ScrollView {
                LazyVStack {
                    ForEach(services.missions) { mission in
                        
                        Text(mission.description!)
                        
                    }
                }
            }
            
        }
        .onAppear() {
            services.decode("https://raw.githubusercontent.com/twostraws/HackingWithSwift/main/SwiftUI/project8-files/missions.json")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
