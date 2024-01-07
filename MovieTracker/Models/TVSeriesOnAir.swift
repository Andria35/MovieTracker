//
//  TVSeriesAir.swift
//  MovieTracker
//
//  Created by Andria Inasaridze on 06.01.24.
//

import Foundation

// MARK: - TVSeriesOnAirResponse
struct TVSeriesOnAirResponse: Decodable {
    let results: [TVSeriesOnAir]
}

// MARK: - TVSeriesOnAir
struct TVSeriesOnAir: Decodable, Identifiable {
    let backdropPath: String
    let id: Int
    let name: String

    enum CodingKeys: String, CodingKey {
        case backdropPath = "backdrop_path"
        case id
        case name
    }
}
