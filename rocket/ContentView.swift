//
//  ContentView.swift
//  rocket
//
//  Created by Vina Melody on 20/12/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            ScheduleView()
                .tabItem {
                    Label("Schedule", systemImage: "calendar")
                }
            ScheduleView()
                .tabItem {
                    Label("News", systemImage: "bubble.right.fill")
                }
            ScheduleView()
                .tabItem {
                    Label("Info", systemImage: "info.square.fill")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
