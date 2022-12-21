//
//  TalkCardView.swift
//  rocket
//
//  Created by Vina Rianti on 21/12/22.
//

import SwiftUI

struct TalkCardView: View {
    var body: some View {
        VStack(alignment: .leading) {
            HStack(alignment: .top) {
                AsyncImage(url: URL(string: "https://iosconf.sg/images/speakers/organiser.png")) { phase in
                    if let image = phase.image {
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                    } else if phase.error != nil {
                        Image("bird")
                    } else {
                        ProgressView()
                    }
                }
                .background {
                    Color.gray
                }
                .clipShape(RoundedRectangle(cornerRadius: 64))
                .frame(maxWidth: 64, maxHeight: 64)

                VStack(alignment: .leading) {
                    Text("9.15 am")
                        .font(.subheadline)
                        .foregroundColor(Color.gray)
                    Text("Speaker name")
                        .font(.title2)
                    Text("@twitter_handle")
                        .font(.caption)
                }
            }

            Text("Supercalifragilistic-ly delicious talk title adds a super long one to make it three lines worth to try")
                .font(.title2.leading(.tight))
                .fontWeight(.semibold)
                .lineLimit(3, reservesSpace: true)
                .lineSpacing(2)
                .foregroundColor(Color.candyOrange)
                .shadow(radius: 20)
        }
        .padding(12)
        .background(Color.sgBackground)
        .cornerRadius(12)
    }
}

struct TalkCardView_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(ColorScheme.allCases, id: \.self) {
            TalkCardView().preferredColorScheme($0)
        }
    }
}
