//
//  MovieDetails+.swift
//  MovieAppTests
//
//  Created by Jason Charalampidis on 9/3/26.
//

import Foundation

extension MovieDetails: Encodable {
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(title,      forKey: .title)
        try container.encode(year,       forKey: .year)
        try container.encode(rated,      forKey: .rated)
        try container.encode(released,   forKey: .released)
        try container.encode(runtime,    forKey: .runtime)
        try container.encode(genre,      forKey: .genre)
        try container.encode(director,   forKey: .director)
        try container.encode(writer,     forKey: .writer)
        try container.encode(actors,     forKey: .actors)
        try container.encode(plot,       forKey: .plot)
        try container.encode(language,   forKey: .language)
        try container.encode(country,    forKey: .country)
        try container.encode(awards,     forKey: .awards)
        try container.encode(poster,     forKey: .poster)
        try container.encode(imdbRating, forKey: .imdbRating)
        try container.encode(imdbID,     forKey: .imdbID)
        try container.encode(type,       forKey: .type)
    }
}
