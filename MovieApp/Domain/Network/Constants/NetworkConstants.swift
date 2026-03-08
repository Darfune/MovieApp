//
//  NetworkConstants.swift
//  MovieApp
//
//  Created by Jason Charalampidis on 7/3/26.
//

import Foundation

public struct NetworkConstants {
    
    public static var apiKey = ObfuscatedLiterals.$apiKey

    public static var baseURL = "https://www.omdbapi.com"
    
    public enum HttpHeaderField: String {
        case auth = "Authentication"
    }
    
    public enum Method: String {
        case get = "GET"
        case post = "POST"
    }

}
