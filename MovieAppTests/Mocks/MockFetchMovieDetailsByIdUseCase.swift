//
//  MockFetchMovieDetailsByIdUseCase.swift
//  MovieAppTests
//
//  Created by Jason Charalampidis on 9/3/26.
//

import Foundation
@testable import MovieApp

final class MockFetchMovieDetailsByIdUseCase: FetchMovieDetailsByIdUseCaseProtocol {
    func execute(id: String) async throws -> MovieApp.MovieDetails {
        if let error = stubbedError { throw error }
        guard let data = stubbedData else { throw URLError(.unknown) }
        return try JSONDecoder().decode(MovieApp.MovieDetails.self, from: data)
    }
    
    var stubbedData: Data?
    var stubbedError: Error?
}
