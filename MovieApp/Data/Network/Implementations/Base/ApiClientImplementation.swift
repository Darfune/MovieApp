//
//  ApiClientImplementation.swift
//  MovieApp
//
//  Created by Jason Charalampidis on 7/3/26.
//

import Foundation

final class ApiClientImplementation: ApiClient {
    
    public init() { }
    
    public func makeRequest<T: Decodable>(to urlRequest: URLRequest) async throws -> T {
        let (data, response) = try await URLSession.shared.data(for: urlRequest)
        
        guard let httpResponse = response as? HTTPURLResponse else {
            throw URLError(.badServerResponse)
        }
        
        switch httpResponse.statusCode {
        case 200...299:
            break
        case 401:
            throw ApiError.unauthorized
        case 404:
            throw ApiError.notFound
        case 500...599:
            throw ApiError.serverError
        default:
            throw ApiError.unexpectedStatusCode(httpResponse.statusCode)
        }

        let decoder = JSONDecoder()
        let result = try decoder.decode(T.self, from: data)
        return result
        
    }
}
