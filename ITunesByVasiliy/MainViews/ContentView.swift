//
//  ContentView.swift
//  ITunesByVasiliy
//
//  Created by Vasiliy on 29.05.2023.
//

import SwiftUI
struct ContentView: View {
    @StateObject private var network = NetworkManager()
    @State private var progress = false
    let errorText = "The data couldn’t be read because it is missing."
    private let columns = [
        GridItem(.adaptive(minimum: UIScreen.main.bounds.width - 20))
    ]
    var body: some View {
        NavigationStack {
            VStack {
                SearchBarView(network: network, progress: $progress)
                VStack {
                    if network.error == "" {
                        scrollView
                    } else {
                        Spacer()
                        VStack {
                            if network.error == errorText {
                                Text("Нет песен по запросу: \n\"\(network.searchText)\"")
                            } else if network.searchText.count == 0 {
                                Text("Введите минимум 3 символа")
                            } else if network.searchText.count == 2 {
                                Text("Введите ещё 1 символ")
                            } else {
                                let charCount = 3 - network.searchText.count
                                Text("Введите ещё \(charCount) символа")
                            }
                        }
                        .multilineTextAlignment(.center)
                        .font(.title2)
                        .fontWeight(.semibold)
                        Spacer()
                    }
                }
                .overlay {
                    if progress {
                        progressView
                    }
                }
            }
            .toolbar(.hidden)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

extension ContentView {
    private var scrollView: some View {
        ScrollViewReader { value in
            ScrollView {
                EmptyView()
                    .id(1)
                LazyVGrid(columns: columns, spacing: 35) {
                    ForEach(network.tracks, id: \.self) { track in
                        HStack {
                            CellView(
                                artistName: track.artistName,
                                trackName: track.trackName,
                                previewUrl: track.previewUrl,
                                artworkUrl100: track.artworkUrl100
                            )
                            .padding(.top, 35)
                        }
                    }
                }
            }
            .scrollDismissesKeyboard(.immediately)
            .onChange(of: network.searchText) { _ in
                withAnimation {
                    value.scrollTo(1, anchor: .top)
                }
            }
        }
    }

    private var progressView: some View {
            ZStack {
                Color.white
                    .ignoresSafeArea()
                ProgressView()
                    .controlSize(.large)
                    .scaleEffect(1.1)
                    .tint(.black)
                    .padding(.bottom, 16)
            }
    }
}
