//
//  ApiClient.swift
//  MovieApp
//
//  Created by Jason Charalampidis on 7/3/26.
//

import Foundation

public protocol ApiClient {
    func makeRequest<T: Decodable>(to urlRequest: URLRequest) async throws -> T
}
