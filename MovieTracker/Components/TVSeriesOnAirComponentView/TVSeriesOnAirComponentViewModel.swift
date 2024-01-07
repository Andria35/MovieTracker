//
//  TVSeriesOnAirComponentViewModel.swift
//  MovieTracker
//
//  Created by Andria Inasaridze on 06.01.24.
//

import SwiftUI
import NetworkManager

final class TVSeriesOnAirComponentViewModel: ObservableObject {
    
    // MARK: - Properties
    private let networkManager: APIServices
    let tvSeriesOnAir: TVSeriesOnAir
    @Published var tvSeriesOnAirImage: Image = Image(systemName: "photo")

    
    // MARK: Initialization
    init(networkManager: APIServices, tvSeriesOnAir: TVSeriesOnAir) {
        self.networkManager = networkManager
        self.tvSeriesOnAir = tvSeriesOnAir
        Task {
            await fetchImage(urlString: "https://image.tmdb.org/t/p/w500\(tvSeriesOnAir.backdropPath)")
        }
    }
    
    // MARK: - API Calls
    private func fetchImage(urlString: String) async {
        do {
            let image = try await networkManager.fetchImage(fromURL: urlString)
            await MainActor.run {
                tvSeriesOnAirImage =  Image(uiImage: image)
            }
        } catch {
            print(error)
        }
    }
}
