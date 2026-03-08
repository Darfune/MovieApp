//
//  Codable+.swift
//  DomainLayer
//
//  Created by Jason Charalampidis on 7/3/26.
//

import Foundation

public let jsonEncoder = JSONEncoder()
public let jsonDecoder = JSONDecoder()

extension Encodable {
    public func encode(_ encoder: JSONEncoder = jsonEncoder) -> Data? {
        try? encoder.encode(self)
    }
}

extension Decodable {
    public static func decode(from data: Data, using decoder: JSONDecoder = jsonDecoder) -> Self? {
        try? decoder.decode(Self.self, from: data)
    }
}
