//
//  NetworkManager.swift
//  ITunesByVasiliy
//
//  Created by Vasiliy on 29.05.2023.
//

import Foundation
import SwiftUI

class NetworkManager: ObservableObject {

    @Published var searchText = ""
    @Published var tracks: [Track] = []
    @Published var error = "error"

    func fetchMusic() {
        guard let url = URL(
            string: "https://itunes.apple.com/search?term=\(searchText)"
        ) else { return }
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else {
                print(error?.localizedDescription ?? "No error description")
                return
            }
            do {
                let music = try JSONDecoder().decode(Music.self, from: data)
//                print(music)
                DispatchQueue.main.async {
                    self.tracks = music.results
                }
            } catch let error {
                DispatchQueue.main.async {
                    self.error = error.localizedDescription
                }
                print(error.localizedDescription)
            }
        }.resume()
    }
}
