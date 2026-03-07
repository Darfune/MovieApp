//
//  MovieDetail.swift
//  MovieApp
//
//  Created by Jason Charalampidis on 7/3/26.
//

import Foundation

public struct MovieDetail: Decodable, Equatable {
    let title: String
    let year: String
    let rated: String
    let released: String
    let runtime: String
    let genre: String
    let director: String
    let writer: String
    let actors: String
    let plot: String
    let language: String
    let country: String
    let awards: String
    let poster: String
    let imdbRating: String
    let imdbID: String
    let type: String
    
    enum CodingKeys: String, CodingKey {
        case title = "Title"
        case year = "Year"
        case rated = "Rated"
        case released = "Released"
        case runtime = "Runtime"
        case genre = "Genre"
        case director = "Director"
        case writer = "Writer"
        case actors = "Actors"
        case plot = "Plot"
        case language = "Language"
        case country = "Country"
        case awards = "Awards"
        case poster = "Poster"
        case imdbRating = "imdbRating"
        case imdbID = "imdbID"
        case type = "Type"
    }
}
