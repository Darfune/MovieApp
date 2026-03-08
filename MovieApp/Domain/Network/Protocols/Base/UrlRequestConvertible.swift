//
//  UrlRequestConvertible.swift
//  MovieApp
//
//  Created by Jason Charalampidis on 7/3/26.
//

import Foundation

public protocol UrlRequestConvertible {
    var url: String { get }
    var queryParams: [String: String] { get }
    var headers: (key: String, value: String)? { get }
    var method: String { get }
    var body: Data? { get }
    
    func asURLRequest() throws -> URLRequest
}

public extension UrlRequestConvertible {
    
    func asURLRequest() throws -> URLRequest {
        guard var components = URLComponents(string: url) else {
            throw ApiError.invalidResponse
        }
        
        components.queryItems = queryParams.map { URLQueryItem(name: $0.key, value: $0.value) }
        
        guard let finalURL = components.url else {
            throw ApiError.invalidResponse
        }
        
        var request = URLRequest(url: finalURL)
        request.httpMethod = method
        request.httpBody = body
        
        if let headers = headers {
            request.setValue(headers.value, forHTTPHeaderField: headers.key)
        }
        
        return request
    }
}
