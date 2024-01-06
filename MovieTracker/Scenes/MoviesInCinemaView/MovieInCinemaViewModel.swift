//
//  MovieInCinemaViewModel.swift
//  MovieTracker
//
//  Created by Mariam Mchedlidze on 06.01.24.
//


import SwiftUI
import NetworkManager

class MovieInCinemaViewModel: ObservableObject {
    @Published var movies: [CinemaMovieModel] = []
    private let networkManager = NetworkManager()
    
    
    private let url = "https://api.themoviedb.org/3/movie/now_playing?api_key=ff8cc5d24b4e6325ebb3fd781ac1463d"
    private let imageUrlCinema = "https://image.tmdb.org/t/p/w500"
    
    init() {
        fetchCinemaMovies()
    }
    
    private func fetchCinemaMovies() {
       
        Task {
            do {
                if let response: CinemaMoviesResponse = try await networkManager.fetchData(fromURL: url) {
                    movies = response.results
                }
            } catch {
                print(error)
            }
        }
    }
    
    func fetchCinemaImage(imageUrl: String) -> String {
            "\(imageUrlCinema)\(imageUrl)"
        }
}
