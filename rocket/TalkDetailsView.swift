//
//  TalkDetailsView.swift
//  rocket
//
//  Created by Vina Rianti on 21/12/22.
//

import SwiftUI

struct TalkDetailsView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
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
                .frame(maxWidth: 72, maxHeight: 72)

                VStack(alignment: .leading) {
                    Text("9.15 am")
                        .font(.subheadline)
                        .foregroundColor(Color.gray)
                    Text("Speaker name")
                        .font(.title)
                    Text("@twitter_handle")
                        .font(.body)
                }
            }

            Text("Supercalifragilistic-ly delicious talk title adds a super long one to make it three lines worth to try")
                .font(.largeTitle.leading(.tight))
                .fontWeight(.semibold)
                .lineLimit(5, reservesSpace: true)
                .lineSpacing(2)
                .foregroundColor(Color.candyOrange)
                .shadow(radius: 20)

            Text("Some description here")
                .font(.body)

            Spacer()
        }
        .padding(16)
        .background(Color.sgBackground)
    }
}

struct TalkDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(ColorScheme.allCases, id: \.self) {
            TalkDetailsView().preferredColorScheme($0)
        }
    }
}
