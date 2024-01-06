//
//  TVSeriesOnAirDetails.swift
//  MovieTracker
//
//  Created by Andria Inasaridze on 06.01.24.
//

import Foundation

// MARK: - TVSeriesOnAirDetails
struct TVSeriesOnAirDetails: Decodable {
    let firstAirDate: String
    let name: String
    let numberOfEpisodes, numberOfSeasons: Int
    let overview: String
    let posterPath: String

    enum CodingKeys: String, CodingKey {
        case firstAirDate = "first_air_date"
        case name
        case numberOfEpisodes = "number_of_episodes"
        case numberOfSeasons = "number_of_seasons"
        case overview
        case posterPath = "poster_path"
    }
}
