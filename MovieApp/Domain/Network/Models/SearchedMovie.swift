//
//  SearchedMovie.swift
//  MovieApp
//
//  Created by Jason Charalampidis on 8/3/26.
//

import Foundation

struct SearchedMovie: Decodable, Identifiable {
    let title: String
    let year: String
    let imdbID: String
    let type: String
    let poster: String

    var id: String { imdbID }

    var posterURL: URL? {
        poster != "N/A" ? URL(string: poster) : nil
    }

    enum CodingKeys: String, CodingKey {
        case title   = "Title"
        case year    = "Year"
        case imdbID  = "imdbID"
        case type    = "Type"
        case poster  = "Poster"
    }
}

extension SearchedMovie {
    static let mocks: [SearchedMovie] = [
        SearchedMovie(
            title: "Blade Runner",
            year: "1982",
            imdbID: "tt0083658",
            type: "movie",
            poster: "https://m.media-amazon.com/images/M/MV5BOWQ4YTBmNTQtMDYxMC00NGFjLTkwOGQtNzdhNmY1Nzc1MzUxXkEyXkFqcGc@._V1_SX300.jpg"
        ),
        SearchedMovie(
            title: "Blade Runner 2049",
            year: "2017",
            imdbID: "tt1856101",
            type: "movie",
            poster: "https://m.media-amazon.com/images/M/MV5BNzA1Njg4NzYxOV5BMl5BanBnXkFtZTgwODk5NjU3MzI@._V1_SX300.jpg"
        ),
        SearchedMovie(
            title: "The Shawshank Redemption",
            year: "1994",
            imdbID: "tt0111161",
            type: "movie",
            poster: "https://m.media-amazon.com/images/M/MV5BNDE3ODcxYzMtY2YzZC00NmNlLWJiNDMtZDViZWM2MzIxZDYwXkEyXkFqcGdeQXVyNjAwNDUxODI@._V1_SX300.jpg"
        ),
        SearchedMovie(
            title: "The Dark Knight",
            year: "2008",
            imdbID: "tt0468569",
            type: "movie",
            poster: "https://m.media-amazon.com/images/M/MV5BMTMxNTMwODM0NF5BMl5BanBnXkFtZTcwODAyMTk2Mw@@._V1_SX300.jpg"
        ),
        SearchedMovie(
            title: "Inception",
            year: "2010",
            imdbID: "tt1375666",
            type: "movie",
            poster: "https://m.media-amazon.com/images/M/MV5BMjAxMzY3NjcxNF5BMl5BanBnXkFtZTcwNTI5OTM0Mw@@._V1_SX300.jpg"
        ),
        SearchedMovie(
            title: "Pulp Fiction",
            year: "1994",
            imdbID: "tt0110912",
            type: "movie",
            poster: "https://m.media-amazon.com/images/M/MV5BNGNhMDIzZTUtNTBlZi00MTRlLWFjM2ItYzViMjE3YzI5MjljXkEyXkFqcGdeQXVyNzkwMjQ5NzM@._V1_SX300.jpg"
        ),
        SearchedMovie(
            title: "Interstellar",
            year: "2014",
            imdbID: "tt0816692",
            type: "movie",
            poster: "https://m.media-amazon.com/images/M/MV5BZjdkOTU3MDktN2IxOS00OGEyLWFmMjktY2FiMmZkNWIyODZiXkEyXkFqcGdeQXVyMTMxODk2OTU@._V1_SX300.jpg"
        ),
        SearchedMovie(
            title: "Parasite",
            year: "2019",
            imdbID: "tt6751668",
            type: "movie",
            poster: "https://m.media-amazon.com/images/M/MV5BYWZjMjk3ZTItODQ2ZC00NTY5LWE0ZDYtZTI3MjcwN2Q5NTVkXkEyXkFqcGdeQXVyODk4OTc3MTY@._V1_SX300.jpg"
        ),
        SearchedMovie(
            title: "The Matrix",
            year: "1999",
            imdbID: "tt0133093",
            type: "movie",
            poster: "https://m.media-amazon.com/images/M/MV5BNzQzOTk3OTAtNDQ0Zi00ZTVlLTM5YTgtZjNmM2I1NjgwZmQwXkEyXkFqcGdeQXVyNjU0OTQ0OTY@._V1_SX300.jpg"
        ),
        SearchedMovie(
            title: "Forrest Gump",
            year: "1994",
            imdbID: "tt0109830",
            type: "movie",
            poster: "https://m.media-amazon.com/images/M/MV5BNWIwODRlZTUtY2U3ZS00Yzg1LWJhNzYtMmZiYmEyNmU1NjMzXkEyXkFqcGdeQXVyMTQxNzMzNDI@._V1_SX300.jpg"
        )
    ]
}
