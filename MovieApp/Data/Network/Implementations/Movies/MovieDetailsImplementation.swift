//
//  MovieDetailsImplementation.swift
//  MovieApp
//
//  Created by Jason Charalampidis on 8/3/26.
//

import Foundation

final class MovieDetailsImplementation: MovieDetailsProtocol {
    
    private let apiClient: ApiClient
    
    public init(apiClient: ApiClient) {
        self.apiClient = apiClient
    }
    
    func fetchMovieDetails(by id: String) async throws -> MovieDetails {
        let url = try GetMovieUrlBuilder.byId(id: id).asURLRequest()
        return try await apiClient.makeRequest(to: url)
    }
    
    func fetchMovieDetails(with title: String) async throws -> MovieDetails {
        let url = try GetMovieUrlBuilder.byTitle(title: title).asURLRequest()
        return try await apiClient.makeRequest(to: url)
    }
    
}
