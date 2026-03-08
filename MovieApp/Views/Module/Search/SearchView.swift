//
//  SearchView.swift
//  MovieApp
//
//  Created by Jason Charalampidis on 8/3/26.
//

import SwiftUI

struct SearchView: View {
    @StateObject private var vm = SearchViewModel()

    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                SearchBar(text: $vm.query)
                    .padding(.horizontal, 16)
                    .padding(.vertical, 10)

                Divider()

                List {
                    switch vm.state {
                    case .idle:
                        ContentUnavailableView("Search for a Movie", systemImage: "popcorn")
                            .listRowSeparator(.hidden)

                    case .loading:
                        ProgressView()
                            .frame(maxWidth: .infinity)
                            .listRowSeparator(.hidden)

                    case .results(let movies):
                        ForEach(movies) { movie in
                            NavigationLink(destination: MovieDetailView(imdbID: movie.imdbID)) {
                                MovieRow(movie: movie)
                            }
                        }

                    case .empty:
                        ContentUnavailableView.search(text: vm.query)
                            .listRowSeparator(.hidden)

                    case .error(let message):
                        ContentUnavailableView("Error", systemImage: "exclamationmark.triangle",
                                               description: Text(message))
                            .listRowSeparator(.hidden)
                    }
                }
                .listStyle(.plain)
            }
            .navigationTitle("Movies")
            .onChange(of: vm.query) { vm.queryChanged() }
        }
    }
}

#Preview {
    SearchView()
}
