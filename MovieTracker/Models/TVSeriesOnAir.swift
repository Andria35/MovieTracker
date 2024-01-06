//
//  TVSeriesAir.swift
//  MovieTracker
//
//  Created by Andria Inasaridze on 06.01.24.
//

import Foundation

// MARK: - TVShowsResponse
struct TVShowsResponse: Codable {
    let results: [TVSeriesOnAir]

}

// MARK: - Result
struct TVSeriesOnAir: Codable, Identifiable {
    let adult: Bool
    let backdropPath: String
    let genreIDS: [Int]
    let id: Int
    let originCountry: [String]
    let originalLanguage, originalName, overview: String
    let popularity: Double
    let posterPath, firstAirDate, name: String
    let voteAverage: Double
    let voteCount: Int

    enum CodingKeys: String, CodingKey {
        case adult
        case backdropPath = "backdrop_path"
        case genreIDS = "genre_ids"
        case id
        case originCountry = "origin_country"
        case originalLanguage = "original_language"
        case originalName = "original_name"
        case overview, popularity
        case posterPath = "poster_path"
        case firstAirDate = "first_air_date"
        case name
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }
}
