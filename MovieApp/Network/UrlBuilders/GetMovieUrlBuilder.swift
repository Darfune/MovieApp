//
//  GetMovieUrlBuilder.swift
//  MovieApp
//
//  Created by Jason Charalampidis on 7/3/26.
//

import Foundation

enum GetMovieUrlBuilder: UrlRequestConvertible {
    case byId(id: String)
    case byTitle(title: String)
    case bySearch(query: String, page: Int)
    
    var url: String { NetworkConstants.baseURL }
    
    var queryParams: [String: String] {
        var params: [String: String] = ["apikey": apiKey]
        
        switch self {
        case .byId(let id):
            params["i"] = id
        case .byTitle(let title):
            params["t"] = title
        case .bySearch(let query, let page):
            params["s"] = query
            params["page"] = "\(page)"
        }
        
        return params
    }
    
    var headers: (key: String, value: String)? { nil }
    
    var method: String { NetworkConstants.Method.get.rawValue }
    
    var body: Data? { nil }
}
