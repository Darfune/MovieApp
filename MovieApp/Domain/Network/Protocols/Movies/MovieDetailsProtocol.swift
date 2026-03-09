//
//  MovieDetailsProtocol.swift
//  Domain
//
//  Created by Jason Charalampidis on 8/3/26.
//

import Foundation

protocol MovieDetailsProtocol {
    func fetchMovieDetails(by id: String) async throws -> MovieDetails
}


protocol FetchMovieDetailsByIdUseCaseProtocol {
    func execute(id: String) async throws -> MovieDetails
}
