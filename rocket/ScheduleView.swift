//
//  ScheduleView.swift
//  rocket
//
//  Created by Vina Melody on 20/12/22.
//

import SwiftUI

struct ScheduleView: View {

    @EnvironmentObject var schedule: ScheduleObservable

    var body: some View {
        ScrollViewReader { proxy in
            ForEach(schedule.talks) { talk in
                NavigationLink(tag: talk, selection: $schedule.selectedTalk) {
                    TalkDetailsView()
                } label: {
                    TalkCardView(talk: talk)
                }
            }
        }
    }
}

struct ScheduleView_Previews: PreviewProvider {
    static var previews: some View {
        ForEach([ColorScheme.light, .dark], id: \.self) { scheme in
            NavigationView {
                ScheduleView()
                    .navigationTitle(Text("Schedule", comment: "Navigation title for the full list of schedule"))
                    .environmentObject(ScheduleObservable())
            }
            .preferredColorScheme(scheme)
        }
    }
}
