//
//  MovieRow.swift
//  MovieApp
//
//  Created by Jason Charalampidis on 8/3/26.
//

import SwiftUI

struct MovieRow: View {
    let movie: MovieDetail

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
        MovieRow(movie: MovieDetail.mocks[0])
        MovieRow(movie: MovieDetail.mocks[1])
        MovieRow(movie: MovieDetail.mocks[2])
        MovieRow(movie: MovieDetail.mocks[3])
        MovieRow(movie: MovieDetail.mocks[4])
        MovieRow(movie: MovieDetail.mocks[5])
        MovieRow(movie: MovieDetail.mocks[6])
        MovieRow(movie: MovieDetail.mocks[7])
        MovieRow(movie: MovieDetail.mocks[8])
        MovieRow(movie: MovieDetail.mocks[9])
    }
}
