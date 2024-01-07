//
//  MovieDetailsViewModel.swift
//  MovieTracker
//
//  Created by Sofo Machurishvili on 06.01.24.
//

import Foundation
import NetworkManager

final class MovieDetailsViewModel: ObservableObject {
    // MARK: - Properties
    @Published var movieDetails: MovieModel? = nil
    private let networkManager: APIServices
    private let apiKey = "53b1afc277745d64ccd210af319cbed6"
    private let endpoint = "https://api.themoviedb.org/3/movie"
    
    // MARK: - Inits
    init(networkManager: APIServices, movieId: Int) {
        self.networkManager = networkManager
        getMovieDetails(movieId: movieId)
    }
    
    // MARK: - Methods
    private func getMovieDetails(movieId: Int) {
        let url = "\(endpoint)/\(movieId)?api_key=\(apiKey)"
        
        Task {
            do {
                if let response: MovieModel = try await networkManager.fetchData(fromURL: url) {
                    await MainActor.run {
                        movieDetails = response
                    }
                }
            } catch {
                print(error)
            }
        }
    }
}

