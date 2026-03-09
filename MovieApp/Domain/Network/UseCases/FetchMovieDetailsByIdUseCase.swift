//
//  FetchMovieDetailsByIdUseCase.swift
//  MovieApp
//
//  Created by Jason Charalampidis on 8/3/26.
//

import Foundation

final class FetchMovieDetailsByIdUseCase {
    private let repository: MovieDetailsProtocol
    
    init(repository: MovieDetailsProtocol) {
        self.repository = repository
    }
    
    func execute(id: String) async throws -> MovieDetails {
        try await repository.fetchMovieDetails(by: id)
    }
}

extension FetchMovieDetailsByIdUseCase: FetchMovieDetailsByIdUseCaseProtocol {}
