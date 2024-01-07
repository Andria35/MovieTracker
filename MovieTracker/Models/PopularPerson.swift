//
//  PopularPerson.swift
//  MovieTracker
//
//  Created by salome on 07.01.24.
//

import Foundation

// MARK: - PopularPersonsResponse
struct PopularPersonsResponse: Decodable {
    let results: [PopularPerson]
    
}

// MARK: - Result
struct PopularPerson: Decodable, Identifiable {
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

