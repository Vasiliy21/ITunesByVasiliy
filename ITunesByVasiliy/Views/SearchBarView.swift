//
//  SearchBarView.swift
//  ITunesByVasiliy
//
//  Created by Vasiliy on 29.05.2023.
//

import SwiftUI

struct SearchBarView: View {
    @ObservedObject var network: NetworkManager
    @Binding var progress: Bool

    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundColor(
                    network.searchText.count < 3 ? .secondary : Color.black
                )
            TextField("Название  песни", text: $network.searchText)
                .disableAutocorrection(true)
                .keyboardType(.asciiCapable)
                .submitLabel(.search)
                .onChange(of: network.searchText) { _ in
                    network.tracks.removeAll()
                    if network.searchText.count >= 3 {
                        progress = true
                        network.error = ""
                        network.fetchMusic()
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                            progress = false
                        }
                    } else if network.searchText.count < 3 {
                        progress = false
                        network.error = "error"
                    }
                }
            Image(systemName: "xmark")
                .padding(15)
                .scaleEffect(1.2)
                .offset(x: 8)
                .foregroundColor(
                    network.searchText.isEmpty ? .secondary : Color.black
                )
                .opacity(network.searchText.isEmpty ? 0.0 : 1.0)
                .onTapGesture {
                    network.tracks.removeAll()
                    network.error = "error"
                    UIApplication.shared.endEditing()
                    network.searchText = ""
                }
        }
        .font(.headline)
        .padding(8)
        .background(
            RoundedRectangle(cornerRadius: 10, style: .continuous)
                .fill(.ultraThinMaterial)
        )
        .padding(.horizontal, 9)
    }
}

struct SearchBarView_Previews: PreviewProvider {
    static var previews: some View {
        SearchBarView(network: NetworkManager(), progress: .constant(false))
    }
}

