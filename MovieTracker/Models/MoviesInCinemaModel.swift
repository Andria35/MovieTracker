//
//  MoviesInCinemaModel.swift
//  MovieTracker
//
//  Created by Mariam Mchedlidze on 06.01.24.
//

import Foundation

// MARK: - MoviesResponse
struct CinemaMoviesResponse: Decodable {
    let results: [CinemaMovieModel]
}

// MARK: - Dates
struct Dates: Codable {
    let maximum, minimum: String
}

// MARK: - MoviesModel
struct CinemaMovieModel: Decodable, Identifiable {
    let backdropPath: String
    let id: Int
    let posterPath, title: String

    enum CodingKeys: String, CodingKey {
        case backdropPath = "backdrop_path"
        case id
        case posterPath = "poster_path"
        case title
    }
}
