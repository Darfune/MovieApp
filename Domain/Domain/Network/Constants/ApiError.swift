//
//  ApiError.swift
//  MovieApp
//
//  Created by Jason Charalampidis on 7/3/26.
//

import Foundation

public enum ApiError: Error, Equatable {
    case unauthorized
    case notFound
    case serverError
    case unexpectedStatusCode(Int)
    case decodingFailed
    case invalidResponse
}
