//
//  MockApiClient.swift
//  MovieAppTests
//
//  Created by Jason Charalampidis on 9/3/26.
//

import Foundation
@testable import MovieApp

final class MockApiClient: ApiClient {

    var stubbedData: Data?
    var stubbedError: Error?

    func makeRequest<T: Decodable>(to urlRequest: URLRequest) async throws -> T {
        if let error = stubbedError { throw error }
        guard let data = stubbedData else { throw URLError(.unknown) }
        return try JSONDecoder().decode(T.self, from: data)
    }
}

