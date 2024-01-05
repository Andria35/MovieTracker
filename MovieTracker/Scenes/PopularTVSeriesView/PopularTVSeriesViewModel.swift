//
//  PopularTVSeriesViewModel.swift
//  MovieTracker
//
//  Created by Luka Gazdeliani on 05.01.24.
//

import SwiftUI
import NetworkManager

final class PopularTVSeriesViewModel: ObservableObject {
    // MARK: - Properties
    @Published var tvSeries: [PopularTVSeries] = []
    let networkManager: APIServices
    
    // MARK: - Init
    init(networkManager: APIServices) {
        self.networkManager = networkManager
        Task {
            await fetchTVSeriesData()
        }
    }
    
    // MARK: - Methods
    func fetchTVSeriesData() async {
        let urlString = "https://api.themoviedb.org/3/discover/tv?include_adult=false&language=en-US&page=1&sort_by=popularity.desc&api_key=6eba9c07b10a9dbccd016ffdfea557c8#"
        do {
            let tvSeriesResponse: PopularTVSeriesData = try await networkManager.fetchData(fromURL: urlString)
            await MainActor.run {
                tvSeries = tvSeriesResponse.results
            }
        }
        catch {
            print(error)
        }
    }
}

