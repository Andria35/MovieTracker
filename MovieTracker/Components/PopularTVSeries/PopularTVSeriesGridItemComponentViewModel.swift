//
//  PopularTVSeriesGridItemComponentViewModel.swift
//  MovieTracker
//
//  Created by Luka Gazdeliani on 06.01.24.
//

import SwiftUI
import NetworkManager

final class PopularTVSeriesGridItemComponentViewModel: ObservableObject {
    // MARK: - Properties
    @Published var tvSeriesImage: Image = Image(systemName: "photo")
    let tvSeries: PopularTVSeries
    let networkManager: APIServices
    
    // MARK: - Init
    init(tvSeries: PopularTVSeries, networkManager: APIServices) {
        self.tvSeries = tvSeries
        self.networkManager = networkManager
        Task {
            await fetchImage(urlString: "https://image.tmdb.org/t/p/w500\(tvSeries.backdropPath)")
        }
    }
    
    // MARK: - Methods
    
    // MARK: - API Calls
    private func fetchImage(urlString: String) async  {
        do {
            let image = try await networkManager.fetchImage(fromURL: urlString)
            await MainActor.run {
                tvSeriesImage = Image(uiImage: image)
            }
        } catch {
            print(error)
            await MainActor.run {
                tvSeriesImage = Image(systemName: "photo")
            }
        }
    }
}
