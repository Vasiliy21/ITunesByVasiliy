//
//  Music.swift
//  ITunesByVasiliy
//
//  Created by Vasiliy on 29.05.2023.
//

import Foundation
struct Music: Decodable, Hashable {
    let results: [Track]
}

struct Track: Decodable, Hashable {
    let artistName: String
    let trackName: String
    let previewUrl: String
    let artworkUrl100: String
}
