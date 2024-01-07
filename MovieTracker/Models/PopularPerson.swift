//
//  PopularPerson.swift
//  MovieTracker
//
//  Created by salome on 06.01.24.
//

import Foundation

// MARK: - PopularPersonsResponse
struct PopularPersonsResponse: Codable {
    let results: [PopularPerson]

}

// MARK: - Result
struct PopularPerson: Codable, Identifiable {
    let adult: Bool
      let id: Int
    let name: String
    let popularity: Double
    let profilePath: String?

    enum CodingKeys: String, CodingKey {
        case adult, id
        case name
        case popularity
        case profilePath = "profile_path"
    }
}

