//
//  TVSeriesOnAirDetailsViewModel.swift
//  MovieTracker
//
//  Created by Andria Inasaridze on 06.01.24.
//

import SwiftUI
import NetworkManager

final class TVSeriesOnAirDetailsViewModel: ObservableObject {
    
    // MARK: - Properties
    let id: Int
    let networkManager: APIServices
    @Published var posterPath = ""
    @Published var name = ""
    @Published var tvSeriesOnAirImage = Image(systemName: "photo")
    @Published var overview = ""
    @Published var numberOfEpisodes = 0
    @Published var numberOfSeasons = 0
    @Published var language = ""
    
    // MARK: - Initialization
    init(id: Int, networkManager: APIServices) {
        self.id = id
        self.networkManager = networkManager
        Task {
            await fetchTVSeriesOnAirDetails()
            await fetchImage(urlString: "https://image.tmdb.org/t/p/w500\(posterPath)")
        }
    }
    
    // MARK: - API Calls
    private func fetchTVSeriesOnAirDetails() async {
        let apiKey = "eb48012526011eb1da6f6963274b867d"
        let urlString = "https://api.themoviedb.org/3/tv/\(id)?api_key=\(apiKey)"

        do {
            let tvSeriesOnAirDetails: TVSeriesOnAirDetails = try await networkManager.fetchData(fromURL: urlString)
            await MainActor.run {
                posterPath = tvSeriesOnAirDetails.posterPath
                name = tvSeriesOnAirDetails.name
                overview = tvSeriesOnAirDetails.overview
                numberOfSeasons = tvSeriesOnAirDetails.numberOfSeasons
                numberOfEpisodes = tvSeriesOnAirDetails.numberOfEpisodes
                language = tvSeriesOnAirDetails.originalLanguage
            }
        } catch {
            print(error)
        }
    }
    
    private func fetchImage(urlString: String) async{
        
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
