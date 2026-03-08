//
//  MovieSearchImplementation.swift
//  Data
//
//  Created by Jason Charalampidis on 8/3/26.
//

import Foundation
import Domain

public class MovieSearchImplementation: MovieSearchProtocol {
    
    private let apiClient: ApiClient
    
    public init(apiClient: ApiClient) {
        self.apiClient = apiClient
    }
    
    public func searchMovies(query: String, page: Int) async throws -> Domain.SearchResponse {
        let url = try GetMovieUrlBuilder.bySearch(query: query, page: page).asURLRequest()
        return try await apiClient.makeRequest(to: url)
    }
}
    

