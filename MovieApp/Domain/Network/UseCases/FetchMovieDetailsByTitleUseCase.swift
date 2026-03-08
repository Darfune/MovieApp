//
//  FetchMovieDetailsByTitleUseCase.swift
//  MovieApp
//
//  Created by Jason Charalampidis on 8/3/26.
//

import Foundation

final class FetchMovieDetailsByTitleUseCase {
    private let repository: MovieDetailsProtocol
    
    init(repository: MovieDetailsProtocol) {
        self.repository = repository
    }
    
    func execute(title: String) async throws -> MovieDetails {
        try await repository.fetchMovieDetails(with: title)
    }
}
