//
//  MovieDetailsProtocol.swift
//  Domain
//
//  Created by Jason Charalampidis on 8/3/26.
//

import Foundation

public protocol MovieDetailsProtocol {
    func fetchMovieDetails(by id: Int) async throws -> MovieDetails
    func fetchMovieDetails(by title: String) async throws -> MovieDetails
}
