//
//  MovieDetail.swift
//  MovieApp
//
//  Created by Jason Charalampidis on 7/3/26.
//

import Foundation

public struct MovieDetails: Decodable, Equatable, Identifiable {
    public var id: String { imdbID }
    public let title: String
    public let year: String
    public let rated: String
    public let released: String
    public let runtime: String
    public let genre: String
    public let director: String
    public let writer: String
    public let actors: String
    public let plot: String
    public let language: String
    public let country: String
    public let awards: String
    public let poster: String
    public let imdbRating: String
    public let imdbID: String
    public let type: String
    
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

public extension MovieDetails {
    static let mocks: [MovieDetails] = [
        MovieDetails(
            title: "The Shawshank Redemption",
            year: "1994",
            rated: "R",
            released: "14 Oct 1994",
            runtime: "142 min",
            genre: "Drama",
            director: "Frank Darabont",
            writer: "Stephen King, Frank Darabont",
            actors: "Tim Robbins, Morgan Freeman, Bob Gunton",
            plot: "Over the course of several years, two convicts form a friendship, seeking consolation and, eventually, redemption through basic human compassion.",
            language: "English",
            country: "United States",
            awards: "Nominated for 7 Oscars. 21 wins & 43 nominations total.",
            poster: "https://m.media-amazon.com/images/M/MV5BNDE3ODcxYzMtY2YzZC00NmNlLWJiNDMtZDViZWM2MzIxZDYwXkEyXkFqcGdeQXVyNjAwNDUxODI@._V1_SX300.jpg",
            imdbRating: "9.3",
            imdbID: "tt0111161",
            type: "movie"
        ),
        MovieDetails(
            title: "The Godfather",
            year: "1972",
            rated: "R",
            released: "24 Mar 1972",
            runtime: "175 min",
            genre: "Crime, Drama",
            director: "Francis Ford Coppola",
            writer: "Mario Puzo, Francis Ford Coppola",
            actors: "Marlon Brando, Al Pacino, James Caan",
            plot: "The aging patriarch of an organized crime dynasty transfers control of his clandestine empire to his reluctant youngest son.",
            language: "English, Italian, Latin",
            country: "United States",
            awards: "Won 3 Oscars. 31 wins & 30 nominations total.",
            poster: "https://m.media-amazon.com/images/M/MV5BM2MyNjYxNmUtYTAwNi00MTYxLWJmNWYtYzZlODY3ZTk3OTFlXkEyXkFqcGdeQXVyNzkwMjQ5NzM@._V1_SX300.jpg",
            imdbRating: "9.2",
            imdbID: "tt0068646",
            type: "movie"
        ),
        MovieDetails(
            title: "Inception",
            year: "2010",
            rated: "PG-13",
            released: "16 Jul 2010",
            runtime: "148 min",
            genre: "Action, Adventure, Sci-Fi",
            director: "Christopher Nolan",
            writer: "Christopher Nolan",
            actors: "Leonardo DiCaprio, Joseph Gordon-Levitt, Elliot Page",
            plot: "A thief who steals corporate secrets through the use of dream-sharing technology is given the inverse task of planting an idea into the mind of a C.E.O.",
            language: "English, Japanese, French",
            country: "United States, United Kingdom",
            awards: "Won 4 Oscars. 157 wins & 220 nominations total.",
            poster: "https://m.media-amazon.com/images/M/MV5BMjAxMzY3NjcxNF5BMl5BanBnXkFtZTcwNTI5OTM0Mw@@._V1_SX300.jpg",
            imdbRating: "8.8",
            imdbID: "tt1375666",
            type: "movie"
        ),
        MovieDetails(
            title: "Interstellar",
            year: "2014",
            rated: "PG-13",
            released: "07 Nov 2014",
            runtime: "169 min",
            genre: "Adventure, Drama, Sci-Fi",
            director: "Christopher Nolan",
            writer: "Jonathan Nolan, Christopher Nolan",
            actors: "Matthew McConaughey, Anne Hathaway, Jessica Chastain",
            plot: "A team of explorers travel through a wormhole in space in an attempt to ensure humanity's survival.",
            language: "English",
            country: "United States, United Kingdom",
            awards: "Won 1 Oscar. 44 wins & 148 nominations total.",
            poster: "https://m.media-amazon.com/images/M/MV5BZjdkOTU3MDktN2IxOS00OGEyLWFmMjktY2FiMmZkNWIyODZiXkEyXkFqcGdeQXVyMTMxODk2OTU@._V1_SX300.jpg",
            imdbRating: "8.7",
            imdbID: "tt0816692",
            type: "movie"
        ),
        MovieDetails(
            title: "Pulp Fiction",
            year: "1994",
            rated: "R",
            released: "14 Oct 1994",
            runtime: "154 min",
            genre: "Crime, Drama",
            director: "Quentin Tarantino",
            writer: "Quentin Tarantino, Roger Avary",
            actors: "John Travolta, Uma Thurman, Samuel L. Jackson",
            plot: "The lives of two mob hitmen, a boxer, a gangster and his wife, and a pair of diner bandits intertwine in four tales of violence and redemption.",
            language: "English, Spanish, French",
            country: "United States",
            awards: "Won 1 Oscar. 70 wins & 75 nominations total.",
            poster: "https://m.media-amazon.com/images/M/MV5BNGNhMDIzZTUtNTBlZi00MTRlLWFjM2ItYzViMjE3YzI5MjljXkEyXkFqcGdeQXVyNzkwMjQ5NzM@._V1_SX300.jpg",
            imdbRating: "8.9",
            imdbID: "tt0110912",
            type: "movie"
        ),
        MovieDetails(
            title: "The Dark Knight",
            year: "2008",
            rated: "PG-13",
            released: "18 Jul 2008",
            runtime: "152 min",
            genre: "Action, Crime, Drama",
            director: "Christopher Nolan",
            writer: "Jonathan Nolan, Christopher Nolan, David S. Goyer",
            actors: "Christian Bale, Heath Ledger, Aaron Eckhart",
            plot: "When the menace known as the Joker wreaks havoc and chaos on the people of Gotham, Batman must accept one of the greatest psychological and physical tests of his ability to fight injustice.",
            language: "English, Mandarin",
            country: "United States, United Kingdom",
            awards: "Won 2 Oscars. 159 wins & 163 nominations total.",
            poster: "https://m.media-amazon.com/images/M/MV5BMTMxNTMwODM0NF5BMl5BanBnXkFtZTcwODAyMTk2Mw@@._V1_SX300.jpg",
            imdbRating: "9.0",
            imdbID: "tt0468569",
            type: "movie"
        ),
        MovieDetails(
            title: "Schindler's List",
            year: "1993",
            rated: "R",
            released: "04 Feb 1994",
            runtime: "195 min",
            genre: "Biography, Drama, History",
            director: "Steven Spielberg",
            writer: "Thomas Keneally, Steven Zaillian",
            actors: "Liam Neeson, Ralph Fiennes, Ben Kingsley",
            plot: "In German-occupied Poland during World War II, industrialist Oskar Schindler gradually becomes concerned for his Jewish workforce after witnessing their persecution by the Nazis.",
            language: "English, Hebrew, German, Polish",
            country: "United States",
            awards: "Won 7 Oscars. 98 wins & 66 nominations total.",
            poster: "https://m.media-amazon.com/images/M/MV5BNDE4OTEyNzQ3NF5BMl5BanBnXkFtZTcwNjY1NjM5NA@@._V1_SX300.jpg",
            imdbRating: "9.0",
            imdbID: "tt0108052",
            type: "movie"
        ),
        MovieDetails(
            title: "Parasite",
            year: "2019",
            rated: "R",
            released: "08 Nov 2019",
            runtime: "132 min",
            genre: "Comedy, Drama, Thriller",
            director: "Bong Joon Ho",
            writer: "Bong Joon Ho, Han Jin-won",
            actors: "Kang-ho Song, Sun-kyun Lee, Yeo-jeong Jo",
            plot: "Greed and class discrimination threaten the newly formed symbiotic relationship between the wealthy Park family and the destitute Kim clan.",
            language: "Korean, English",
            country: "South Korea",
            awards: "Won 4 Oscars. 308 wins & 263 nominations total.",
            poster: "https://m.media-amazon.com/images/M/MV5BYWZjMjk3ZTItODQ2ZC00NTY5LWE0ZDYtZTI3MjcwN2Q5NTVkXkEyXkFqcGdeQXVyODk4OTc3MTY@._V1_SX300.jpg",
            imdbRating: "8.5",
            imdbID: "tt6751668",
            type: "movie"
        ),
        MovieDetails(
            title: "Forrest Gump",
            year: "1994",
            rated: "PG-13",
            released: "06 Jul 1994",
            runtime: "142 min",
            genre: "Drama, Romance",
            director: "Robert Zemeckis",
            writer: "Winston Groom, Eric Roth",
            actors: "Tom Hanks, Robin Wright, Gary Sinise",
            plot: "The presidencies of Kennedy and Johnson, the Vietnam War, the Watergate scandal and other historical events unfold from the perspective of an Alabama man with an IQ of 75.",
            language: "English",
            country: "United States",
            awards: "Won 6 Oscars. 50 wins & 75 nominations total.",
            poster: "https://m.media-amazon.com/images/M/MV5BNWIwODRlZTUtY2U3ZS00Yzg1LWJhNzYtMmZiYmEyNmU1NjMzXkEyXkFqcGdeQXVyMTQxNzMzNDI@._V1_SX300.jpg",
            imdbRating: "8.8",
            imdbID: "tt0109830",
            type: "movie"
        ),
        MovieDetails(
            title: "The Matrix",
            year: "1999",
            rated: "R",
            released: "31 Mar 1999",
            runtime: "136 min",
            genre: "Action, Sci-Fi",
            director: "Lana Wachowski, Lilly Wachowski",
            writer: "Lilly Wachowski, Lana Wachowski",
            actors: "Keanu Reeves, Laurence Fishburne, Carrie-Anne Moss",
            plot: "When a beautiful stranger leads computer hacker Neo to a forbidding underworld, he discovers the shocking truth: the life he knows is the elaborate deception of an evil cyber-intelligence.",
            language: "English",
            country: "United States, Australia",
            awards: "Won 4 Oscars. 38 wins & 51 nominations total.",
            poster: "https://m.media-amazon.com/images/M/MV5BNzQzOTk3OTAtNDQ0Zi00ZTVlLTM5YTgtZjNmM2I1NjgwZmQwXkEyXkFqcGdeQXVyNjU0OTQ0OTY@._V1_SX300.jpg",
            imdbRating: "8.7",
            imdbID: "tt0133093",
            type: "movie"
        )
    ]
}
