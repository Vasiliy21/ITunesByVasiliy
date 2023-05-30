//
//  CellView.swift
//  ITunesByVasiliy
//
//  Created by Vasiliy on 30.05.2023.
//

import SwiftUI

struct CellView: View {
    let artistName: String
    let trackName: String
    let previewUrl: String
    let artworkUrl100: String

    var body: some View {
        NavigationLink(destination: DetailListView(
            artistName: artistName,
            trackName: trackName,
            previewUrl: previewUrl,
            artworkUrl100: artworkUrl100
        )) {
            ZStack {
                Color(.systemGray4)
                    .cornerRadius(10)
                HStack {
                    URLImageView(
                        image: artworkUrl100,
                        width: 80,
                        height: 80
                    )
                    .background(.black)
                    .cornerRadius(10)
                    .overlay(
                        RoundedRectangle(
                            cornerRadius: 10,
                            style: .continuous
                        )
                        .stroke(lineWidth: 3)
                    )
                    Spacer()
                    VStack {
                        Text(trackName)
                            .font(.title)
                            .fontWeight(.bold)
                        Text(trackName)
                            .font(.title3)
                    }
                    Spacer()
                }
                .padding(10)
            }
            .foregroundColor(Color.black)
            .navigationBarTitle("Поиск")
        }
        .frame(width: UIScreen.main.bounds.width - 20, height: 40)
    }
}

struct CellView_Previews: PreviewProvider {
    static var previews: some View {
        CellView(
            artistName: "Snoop Dog",
            trackName: "Name",
            previewUrl: "",
            artworkUrl100: "https://is4-ssl.mzstatic.com/image/thumb/Music6/v4/22/a0/c4/22a0c436-184b-a0f1-efde-2921708d9d25/itunes.jpg/100x100bb.jpg"
        )
    }
}

