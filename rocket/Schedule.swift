//
//  Schedule.swift
//  rocket
//
//  Created by Vina Rianti on 23/12/22.
//

import Foundation

import Apollo
import ConfAPI

//struct Talk: Identifiable {
//    var id: String
//    var title: String
//    var speakers: [Speaker]
//}
//
//struct Speaker: Identifiable {
//    var id: String
//    var name: String
//}

extension GetScheduleSubscription.Data.Schedule: Identifiable {}
extension GetScheduleSubscription.Data.Schedule.Speaker: Identifiable {}

class ScheduleObservable: ObservableObject {
    private var apollo: ApolloClient!
    private var subscription: Cancellable?

    @Published var talks: [GetScheduleSubscription.Data.Schedule] = []
    @Published var selectedTalk: GetScheduleSubscription.Data.Schedule?

    init() {
        self.apollo = NetworkManager.shared.client
        subscription = apollo.subscribe(subscription: GetScheduleSubscription(), resultHandler: { result in
            guard let data = try? result.get().data else {
                print("get schedule error")
                return
            }
            print(data)
            //            self.createSchedule(from: data)
            self.talks = data.schedule
        })
    }

    private func fetchSchedule() {
    }

//    private func createSchedule(from data: GetScheduleSubscription.Data) {
//        for t in data.schedule {
//            for s in t.speakers {
//                let speakers = Speaker(id: s.id, name: s.name)
//            }
//            let talk = Talk(id: t.id, title: t.title, speakers: <#T##[Speaker]#>)
//        }
//    }

    deinit {
        subscription?.cancel()
    }
}
