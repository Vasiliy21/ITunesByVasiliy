//
//  DetailListView.swift
//  ITunesByVasiliy
//
//  Created by Vasiliy on 30.05.2023.
//

import SwiftUI
import AVKit

struct DetailListView: View {
    @StateObject private var soundManager = SoundManager()
    @State var player = false
    let artistName: String
    let trackName: String
    let previewUrl: String
    let artworkUrl100: String

    var body: some View {
        VStack {
            VStack {
                URLImageView(image: artworkUrl100, width: 250, height: 250)
                    .padding(5)
                    .background(.black)
                    .cornerRadius(15)
                Text(trackName)
                    .font(.title)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.center)
                Text(artistName)
                    .multilineTextAlignment(.center)
            }
            .padding(.top, 64)
            Spacer()
            HStack {
                Image(systemName: player ? "pause.circle": "play.circle")
                    .resizable()
                    .frame(width: 100, height: 100)
                    .onTapGesture {
                        soundManager.playSound(sound: previewUrl)
                        player.toggle()
                        if player {
                            soundManager.audioPlayer?.play()
                        } else {
                            soundManager.audioPlayer?.pause()
                        }
                    }
            }
            .padding(.bottom, 128)
        }
    }
}

struct DetailListView_Previews: PreviewProvider {
    static var previews: some View {
        DetailListView(
            artistName: "Snoop Dog",
            trackName: "Name",
            previewUrl: "https://audio-ssl.itunes.apple.com/itunes-assets/AudioPreview123/v4/45/b3/d4/45b3d41e-25c4-8493-ca06-2e172388d367/mzaf_7037128191760521719.std.aac.p.m4a",
            artworkUrl100: "https://is4-ssl.mzstatic.com/image/thumb/Music6/v4/22/a0/c4/22a0c436-184b-a0f1-efde-2921708d9d25/itunes.jpg/100x100bb.jpg"
        )
    }
}
