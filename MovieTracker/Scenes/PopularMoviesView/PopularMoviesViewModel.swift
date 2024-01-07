//
//  PopularMoviesViewModel.swift
//  MovieTracker
//
//  Created by Sofo Machurishvili on 06.01.24.
//

import Foundation
import NetworkManager

final class PopularMoviesViewModel: ObservableObject {
    // MARK: - Properties
    @Published var movies: [MovieModel] = []
    private let networkManager: APIServices
    private let apiKey = "53b1afc277745d64ccd210af319cbed6"
    private let endpoint = "https://api.themoviedb.org/3/movie/popular"
    
    // MARK: - Inits
    init(networkManager: APIServices) {
        self.networkManager = networkManager
        getPopularMovies()
    }
    
    // MARK: - Methods
    private func getPopularMovies() {
        let url = "\(endpoint)?api_key=\(apiKey)"
        
        Task {
            do {
                if let response: PopularMoviesResponse = try await networkManager.fetchData(fromURL: url) {
                    movies = response.results
                }
            } catch {
                print(error)
            }
        }
    }
}
