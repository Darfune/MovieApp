//
//  SearchResponse.swift
//  MovieAppTests
//
//  Created by Jason Charalampidis on 9/3/26.
//

import Foundation

extension SearchResponse: Encodable {
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(movies,       forKey: .movies)
        try container.encodeIfPresent(totalResults, forKey: .totalResults)
        try container.encode(response,              forKey: .response)
        try container.encodeIfPresent(error,        forKey: .error)
    }
}
