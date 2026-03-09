//
//  MovieSeachProtocol.swift
//  Domain
//
//  Created by Jason Charalampidis on 8/3/26.
//

import Foundation

protocol MovieSearchProtocol {
    func searchMovies(query: String, page: Int) async throws -> SearchResponse
}

protocol SearchMoviesUseCaseProtocol {
    func execute(query: String, page: Int) async throws -> SearchResponse
}
