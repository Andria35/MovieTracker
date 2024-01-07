//
//  MovieHelper.swift
//  MovieTracker
//
//  Created by Sofo Machurishvili on 06.01.24.
//

import Foundation

struct MovieHelper {
    // MARK: - Properties
    private static let rootImagesEndpoint = "https://image.tmdb.org/t/p/w500"
    
    // MARK: - Methods
    static func constructFullImageUrl(imageUrl: String) -> String {
        "\(rootImagesEndpoint)\(imageUrl)"
    }
}
