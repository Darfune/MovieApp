//
//  MovieDetailView.swift
//  MovieApp
//
//  Created by Jason Charalampidis on 8/3/26.
//

import SwiftUI

struct MovieDetailView: View {
    let imdbID: String
    @StateObject private var vm = MovieDetailViewModel()

    var body: some View {
        Group {
            switch vm.state {
            case .idle, .loading:
                ProgressView()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)

            case .loaded(let movie):
                content(movie)

            case .error(let message):
                ContentUnavailableView("Couldn't Load",
                                       systemImage: "exclamationmark.triangle",
                                       description: Text(message))
            }
        }
        .onAppear { vm.load(imdbID: imdbID) }
    }

    private func content(_ movie: MovieDetails) -> some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 24) {
                header(movie)
                Divider()
                    .padding(.horizontal, 16)
                details(movie)
            }
            .padding(.bottom, 32)
        }
        .navigationTitle(movie.title)
        .navigationBarTitleDisplayMode(.inline)
    }

    private func header(_ movie: MovieDetails) -> some View {
        HStack(alignment: .top, spacing: 16) {
            AsyncImage(url: URL(string: movie.poster)) { phase in
                switch phase {
                case .success(let image):
                    image.resizable().aspectRatio(contentMode: .fill)
                default:
                    Color(.secondarySystemBackground)
                        .overlay { Image(systemName: "film").foregroundStyle(.secondary) }
                }
            }
            .frame(width: 100, height: 150)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .shadow(color: .black.opacity(0.12), radius: 6, y: 3)

            VStack(alignment: .leading, spacing: 6) {
                Text(movie.title)
                    .font(.system(.headline, design: .serif))
                    .lineLimit(3)

                Text(movie.year)
                    .font(.subheadline.monospacedDigit())
                    .foregroundStyle(.secondary)

                Text(movie.genre)
                    .font(.caption)
                    .foregroundStyle(.secondary)

                Spacer()

                if let rating = Double(movie.imdbRating) {
                    Label(String(format: "%.1f / 10", rating), systemImage: "star.fill")
                        .font(.subheadline.bold())
                        .foregroundStyle(.orange)
                }
            }
        }
        .padding(.horizontal, 16)
        .padding(.top, 16)
    }

    private func details(_ movie: MovieDetails) -> some View {
        VStack(alignment: .leading, spacing: 20) {
            section("Plot") {
                Text(movie.plot)
                    .font(.system(.body, design: .serif))
                    .lineSpacing(4)
                    .foregroundStyle(.primary)
            }

            section("Cast & Crew") {
                row("Director", movie.director)
                row("Writer",   movie.writer)
                row("Actors",   movie.actors)
            }

            section("Info") {
                row("Released", movie.released)
                row("Runtime",  movie.runtime)
                row("Rated",    movie.rated)
                row("Country",  movie.country)
                row("Language", movie.language)
            }

            if movie.awards != "N/A" {
                section("Awards") {
                    Label(movie.awards, systemImage: "trophy")
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                }
            }
        }
        .padding(.horizontal, 16)
    }
}

#Preview {
    MovieDetailView(imdbID: "tt12344338")
}
