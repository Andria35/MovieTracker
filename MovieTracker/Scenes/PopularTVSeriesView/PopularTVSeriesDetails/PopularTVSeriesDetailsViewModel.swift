//
//  PopularTVSeriesDetailsViewModel.swift
//  MovieTracker
//
//  Created by Luka Gazdeliani on 06.01.24.
//

import SwiftUI
import NetworkManager

final class PopularTVSeriesDetailsViewModel: ObservableObject {
    // MARK: - Properties
    let networkManager: APIServices
    let tvSeriesID: Int
    @Published var fetchedTVSeriesDetailsData = FetchedTVSeriesDetailsData()
    
    // MARK: - Init
    init(networkManager: APIServices, tvSeriesID: Int) {
        self.networkManager = networkManager
        self.tvSeriesID = tvSeriesID
        Task {
            await fetchTVSeriesData()
            await MainActor.run {
                fetchedTVSeriesDetailsData.formatedGenreString = fetchedTVSeriesDetailsData.tvSeriesGenre.map { String($0.name) }.joined(separator: ", ")
            }
        }
    }
    
    // MARK: - Methods
    
    // MARK: - API Calls
    private func fetchTVSeriesData() async {
        let urlString = "https://api.themoviedb.org/3/tv/\(tvSeriesID)?api_key=6eba9c07b10a9dbccd016ffdfea557c8#"
        do {
            let tvSeriesDetailsResponse: PopularTVSeriesDetails = try await networkManager.fetchData(fromURL: urlString)
            await MainActor.run {
                fetchedTVSeriesDetailsData.tvSeriesName = tvSeriesDetailsResponse.name
                fetchedTVSeriesDetailsData.tvSeriesReleaseDate = tvSeriesDetailsResponse.firstAirDate
                fetchedTVSeriesDetailsData.tvSeriesOverview = tvSeriesDetailsResponse.overview
                fetchedTVSeriesDetailsData.tvSeriesGenre = tvSeriesDetailsResponse.genres
                fetchedTVSeriesDetailsData.tvSeriesNumberOfSeasons = tvSeriesDetailsResponse.numberOfSeasons
                fetchedTVSeriesDetailsData.tvSeriesVoteAverage = tvSeriesDetailsResponse.voteAverage
                fetchedTVSeriesDetailsData.tvSeriesImageBackdropPath = tvSeriesDetailsResponse.backdropPath
            }
        }
        catch {
            print(error)
        }
    }
}
