//
//  MoviesModel.swift
//  MovieTracker
//
//  Created by Sofo Machurishvili on 06.01.24.
//

import Foundation

struct MovieModel: Decodable, Identifiable {
    let id: Int
    let title: String
    let posterPath: String
    let overview: String
    let releaseDate: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case posterPath = "poster_path"
        case overview
        case releaseDate = "release_date"
    }
}

struct PopularMoviesResponse: Decodable {
    let results: [MovieModel]
}
