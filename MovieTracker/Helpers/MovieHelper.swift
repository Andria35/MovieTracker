//
//  MovieHelper.swift
//  MovieTracker
//
//  Created by Sofo Machurishvili on 06.01.24.
//

import Foundation

class MovieHelper {
    private static let rootImagesEndpoint = "https://image.tmdb.org/t/p/w500"
    
    static func constructFullImageUrl(imageUrl: String) -> String {
        "\(rootImagesEndpoint)\(imageUrl)"
    }
}
