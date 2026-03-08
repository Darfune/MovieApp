//
//  Mocks.swift
//  MovieAppTests
//
//  Created by Jason Charalampidis on 8/3/26.
//

import Foundation

extension SearchResponse {
    static func success(movies: [SearchedMovie]) -> SearchResponse {
        SearchResponse(movies: movies, totalResults: "\(movies.count)", response: "True", error: nil)
    }

    static func failure(error: String) -> SearchResponse {
        SearchResponse(movies: nil, totalResults: nil, response: "False", error: error)
    }
}

final class MockMovieSearchProtocol: MovieSearchProtocol {
    var result: Result<SearchResponse, Error> = .success(.success(movies: []))
    var capturedQuery: String?
    var capturedPage: Int?

    func searchMovies(query: String, page: Int) async throws -> SearchResponse {
        capturedQuery = query
        capturedPage = page
        return try result.get()
    }
}

final class MockMovieDetailsProtocol: MovieDetailsProtocol {
    var result: Result<MovieDetails, Error> = .failure(URLError(.badURL))
    var capturedID: String?
    var capturedTitle: String?

    func fetchMovieDetails(by id: String) async throws -> MovieDetails {
        capturedID = id
        return try result.get()
    }

    func fetchMovieDetails(with title: String) async throws -> MovieDetails {
        capturedTitle = title
        return try result.get()
    }
}
