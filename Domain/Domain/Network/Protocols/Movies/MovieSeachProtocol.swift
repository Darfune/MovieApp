//
//  MovieSeachProtocol.swift
//  Domain
//
//  Created by Jason Charalampidis on 8/3/26.
//

import Foundation

public protocol MovieSearchProtocol {
    func searchMovies(query: String, page: Int) async throws -> SearchResponse
}
