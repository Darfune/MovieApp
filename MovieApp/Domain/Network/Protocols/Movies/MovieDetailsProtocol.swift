//
//  MovieDetailsProtocol.swift
//  Domain
//
//  Created by Jason Charalampidis on 8/3/26.
//

import Foundation

protocol MovieDetailsProtocol {
    func fetchMovieDetails(by id: String) async throws -> MovieDetails
    func fetchMovieDetails(with title: String) async throws -> MovieDetails
}
