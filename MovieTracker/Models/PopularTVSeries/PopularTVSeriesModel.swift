//
//  PopularTVSeriesModel.swift
//  MovieTracker
//
//  Created by Luka Gazdeliani on 05.01.24.
//

import Foundation

struct PopularTVSeriesData: Decodable {
    let results: [PopularTVSeries]
}

struct PopularTVSeries: Decodable, Identifiable {
    let backdropPath: String
    let firstAirDate: String
    let genreIDS: [Int]
    let id: Int
    let name: String
    let overview: String
    let voteAverage: Double

    enum CodingKeys: String, CodingKey {
        case backdropPath = "backdrop_path"
        case firstAirDate = "first_air_date"
        case genreIDS = "genre_ids"
        case id, name, overview
        case voteAverage = "vote_average"
    }
}
