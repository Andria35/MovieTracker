//
//  PupularTVSeriesDetailsImageComponentViewModel.swift
//  MovieTracker
//
//  Created by Luka Gazdeliani on 06.01.24.
//

import SwiftUI
import NetworkManager

final class PopularTVSeriesDetailsImageComponentViewModel: ObservableObject {
    // MARK: - Properties
    @Published var tvSeriesImage: Image = Image(systemName: "photo")
    var backdropPath: String
    let networkManager: APIServices
    
    // MARK: - Init
    init(backdropPath: String, networkManager: APIServices) {
        self.backdropPath = backdropPath
        self.networkManager = networkManager
        Task {
            await fetchImage(urlString: "https://image.tmdb.org/t/p/w500\(backdropPath)")
        }
    }
    
    // MARK: - Methods
    func fetchImage(urlString: String) async {
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
