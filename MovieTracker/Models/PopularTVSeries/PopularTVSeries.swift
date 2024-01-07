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
    let id: Int
    let name: String

    enum CodingKeys: String, CodingKey {
        case backdropPath = "backdrop_path"
        case id, name
    }
}
