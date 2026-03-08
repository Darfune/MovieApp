//
//  SearchMoviesUseCase.swift
//  MovieApp
//
//  Created by Jason Charalampidis on 8/3/26.
//

import Foundation

final class SearchMoviesUseCase {
    private let repository: MovieSearchProtocol
    
    init(repository: MovieSearchProtocol) {
        self.repository = repository
    }
    
    public func execute(query: String, page: Int) async throws -> SearchResponse {
        try await repository.searchMovies(query: query, page: page)
    }
}
