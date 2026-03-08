//
//  ResponseHandler.swift
//  MovieApp
//
//  Created by Jason Charalampidis on 7/3/26.
//

import Foundation

public protocol ResponseHandler {
    func validateResponse(_ response: URLResponse) throws
    func decode<T: Decodable>(_ data: Data) throws -> T
}
