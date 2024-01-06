//
//  TVSeriesOnAirViewModel.swift
//  MovieTracker
//
//  Created by Andria Inasaridze on 06.01.24.
//

import Foundation
import NetworkManager

final class TVSeriesOnAirViewModel: ObservableObject {
    
    // MARK: - Properties
    let networkManager: APIServices
    @Published var tvShows: [TVSeriesOnAir] = []
    
    // MARK: - Initialization
    init(networkManager: APIServices) {
        self.networkManager = networkManager
        
        Task {
            await fetchTVSeries()
        }
    }
    
    // MARK: - Methods
    
    // MARK: - API Calls
    private func fetchTVSeries() async {
        let apiKey = "eb48012526011eb1da6f6963274b867d"
        let urlString = "https://api.themoviedb.org/3/tv/on_the_air?api_key=\(apiKey)"

        do {
            let tvShowsResponse: TVSeriesOnAirResponse = try await networkManager.fetchData(fromURL: urlString)
            await MainActor.run {
                tvShows = tvShowsResponse.results
            }
        } catch {
            print(error)
        }
    }
}
