//
//  UrlRequestCovertible+.swift
//  DomainLayer
//
//  Created by Jason Charalampidis on 7/3/26.
//

import Foundation

public extension UrlRequestConvertible {
    func asUrlRequest(withTimeout timeoutInterval: TimeInterval) throws -> URLRequest {
        guard let url = URL(string: url) else { throw URLError(.badURL)}
        return setupUrlRequest(url, timeoutInterval: timeoutInterval)
    }
    
    fileprivate func setupUrlRequest(_ url: URL, timeoutInterval: TimeInterval) -> URLRequest {
        var request = URLRequest(url: url, timeoutInterval: timeoutInterval)
        request.httpMethod = method
        request.httpBody = body
        request.addValue(headers?.value ?? "", forHTTPHeaderField: headers?.key ?? "")
        return request
    }
}
