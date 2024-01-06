//
//  PopularTVSeriesDetailsModel.swift
//  MovieTracker
//
//  Created by Luka Gazdeliani on 06.01.24.
//

import Foundation

struct PopularTVSeriesDetails: Decodable {
    let backdropPath: String
    let firstAirDate: String
    let genres: [Genre]
    let id: Int
    let name: String
    let numberOfSeasons: Int
    let overview: String
    let voteAverage: Double

    enum CodingKeys: String, CodingKey {
        case backdropPath = "backdrop_path"
        case firstAirDate = "first_air_date"
        case numberOfSeasons = "number_of_seasons"
        case voteAverage = "vote_average"
        case genres, id, name, overview
    }
}

struct Genre: Decodable {
    let id: Int
    let name: String
}
