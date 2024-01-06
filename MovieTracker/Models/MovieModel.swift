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
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case posterPath = "poster_path"
    }
}

struct PopularMoviesResponse: Decodable {
    let results: [MovieModel]
}
