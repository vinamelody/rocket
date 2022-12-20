//
//  ScheduleView.swift
//  rocket
//
//  Created by Vina Melody on 20/12/22.
//

import SwiftUI

import Apollo

struct ScheduleView: View {
    private var apollo: ApolloClient!
    private var subscription: Cancellable?
    
    init() {
        self.apollo = NetworkManager.shared.client
        subscription = apollo.subscribe(subscription: GetScheduleSubscription(), resultHandler: { result in
            guard let data = try? result.get().data else {
                print("get schedule error")
                return
            }
            print(data)
        })
    }
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct ScheduleView_Previews: PreviewProvider {
    static var previews: some View {
        ScheduleView()
    }
}
