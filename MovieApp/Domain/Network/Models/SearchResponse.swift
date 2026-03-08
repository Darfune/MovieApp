//
//  SearchResponse.swift
//  Data
//
//  Created by Jason Charalampidis on 8/3/26.
//

import Foundation

struct SearchResponse: Decodable {
    let movies: [SearchedMovie]?
    let totalResults: String?
    let response: String
    let error: String?

    var isSuccess: Bool { response == "True" }

    enum CodingKeys: String, CodingKey {
        case movies       = "Search"
        case totalResults = "totalResults"
        case response     = "Response"
        case error        = "Error"
    }
}
