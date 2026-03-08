//
//  MovieRow.swift
//  MovieApp
//
//  Created by Jason Charalampidis on 8/3/26.
//

import SwiftUI

struct MovieRowView: View {
    let movie: SearchedMovie

    var body: some View {
        HStack(spacing: 12) {
            moviePoster
           
            movieInfo

            Spacer()

            chevron
        }
        .padding(.vertical, 4)
    }
    
    
    var moviePoster: some View {
        AsyncImage(url: URL(string: movie.poster)) { phase in
            switch phase {
            case .success(let image):
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
            default:
                Color(.tertiarySystemFill)
                    .overlay {
                        Image(systemName: "film")
                            .foregroundStyle(.secondary)
                    }
            }
        }
        .frame(width: 50, height: 74)
        .clipShape(RoundedRectangle(cornerRadius: 8))
    }
    
    var movieInfo: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(movie.title)
                .font(.system(.body, design: .serif, weight: .semibold))
                .lineLimit(2)
                .foregroundStyle(.primary)

            Text(movie.year)
                .font(.subheadline.monospacedDigit())
                .foregroundStyle(.secondary)
        }
    }
    
    var chevron: some View {
        Image(systemName: "chevron.right")
            .font(.caption.weight(.semibold))
            .foregroundStyle(Color.cinemaAmber)
    }
        
}

#Preview {
    List {
        MovieRowView(movie: SearchedMovie.mocks[0])
        MovieRowView(movie: SearchedMovie.mocks[1])
        MovieRowView(movie: SearchedMovie.mocks[2])
        MovieRowView(movie: SearchedMovie.mocks[3])
        MovieRowView(movie: SearchedMovie.mocks[4])
        MovieRowView(movie: SearchedMovie.mocks[5])
        MovieRowView(movie: SearchedMovie.mocks[6])
        MovieRowView(movie: SearchedMovie.mocks[7])
        MovieRowView(movie: SearchedMovie.mocks[8])
        MovieRowView(movie: SearchedMovie.mocks[9])
    }
}
