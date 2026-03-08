//
//  ApiClientImplementation.swift
//  MovieApp
//
//  Created by Jason Charalampidis on 7/3/26.
//

import Domain
import Foundation

public class ApiClientImplementation: ApiClient {
    
    private let responseHandler: ResponseHandler
    
    public init(responseHandler: ResponseHandler) {
        self.responseHandler = responseHandler
    }
    
    public func makeRequest<T: Decodable>(to url: URLRequest) async throws -> T {
        try await performRequest(url)
    }
    
    // MARK: - Private
    
    private func performRequest<T: Decodable>(_ urlRequest: URLRequest) async throws -> T {
        let (data, response) = try await URLSession.shared.data(for: urlRequest)
        try responseHandler.validateResponse(response)
        return try responseHandler.decode(data)
    }
}
