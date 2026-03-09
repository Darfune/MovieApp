//
//  MockSearchMoviesUseCase.swift
//  MovieAppTests
//
//  Created by Jason Charalampidis on 9/3/26.
//

import Foundation
@testable import MovieApp

final class MockSearchMoviesUseCase: SearchMoviesUseCaseProtocol {
    var stubbedData: Data?
    var stubbedError: Error?
    var stubbedDataProvider: ((Int) throws -> Data)?

    func execute(query: String, page: Int) async throws -> MovieApp.SearchResponse {
        if let error = stubbedError { throw error }
        if let provider = stubbedDataProvider {
            let data = try provider(page)
            return try JSONDecoder().decode(MovieApp.SearchResponse.self, from: data)
        }
        guard let data = stubbedData else { throw URLError(.unknown) }
        return try JSONDecoder().decode(MovieApp.SearchResponse.self, from: data)
    }
}
