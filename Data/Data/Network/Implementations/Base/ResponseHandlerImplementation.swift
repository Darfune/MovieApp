//
//  ResponseHandlerImplementation.swift
//  MovieApp
//
//  Created by Jason Charalampidis on 7/3/26.
//

import Domain
import Foundation

public final class ResponseHandlerImplementation: ResponseHandler {
    
    public init() { }
    
    public func validateResponse(_ response: URLResponse) throws {
        guard let httpResponse = response as? HTTPURLResponse else {
            throw ApiError.invalidResponse
        }
        
        switch httpResponse.statusCode {
        case 200...299:
            return
        case 401:
            throw ApiError.unauthorized
        case 404:
            throw ApiError.notFound
        case 500...599:
            throw ApiError.serverError
        default:
            throw ApiError.unexpectedStatusCode(httpResponse.statusCode)
        }
    }
    
    public func decode<T: Decodable>(_ data: Data) throws -> T {
        do {
            let decoder = JSONDecoder()
            return try decoder.decode(T.self, from: data)
        } catch {
            throw ApiError.decodingFailed
        }
    }
}
