//
//  URLImageView.swift
//  ITunesByVasiliy
//
//  Created by Vasiliy on 30.05.2023.
//

import SwiftUI

struct URLImageView: View {

    let image: String
    let width: CGFloat
    let height: CGFloat

    var body: some View {
        AsyncImage(url: URL(string: image), transaction: Transaction(animation: .default)) { phase in
            switch phase {
            case .success(let image):
                ZStack {
                    Color.black
                    image
                        .resizable()
                        .scaledToFill()
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                }
                .transition(.opacity)
            case .failure(_):
                ZStack {
                    RoundedRectangle(cornerRadius: 20,style: .continuous)
                        .foregroundColor(Color.black)
                    Image(systemName: "exclamationmark.circle")
                        .resizable()
                        .scaledToFit()
                        .background(Color.accentColor)
                        .foregroundColor(Color("Grid"))
                        .padding()
                }
                .transition(.opacity)

            case .empty:
                        ProgressView()
                    .tint(.white)
                            .scaleEffect(1.2)
                    .transition(.opacity)
            @unknown default:
                EmptyView()
            }
        }
        .frame(width: width, height: height)
        .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
        .transition(.move(edge: .bottom))
    }
}

struct URLImageView_Previews: PreviewProvider {
    static var previews: some View {
        URLImageView(
            image: "https://is4-ssl.mzstatic.com/image/thumb/Music6/v4/22/a0/c4/22a0c436-184b-a0f1-efde-2921708d9d25/itunes.jpg/100x100bb.jpg",
            width: 340,
            height: 340
        )
    }
}
