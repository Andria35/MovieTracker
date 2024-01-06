//
//  PopularTVSeriesDetailsViewModel.swift
//  MovieTracker
//
//  Created by Luka Gazdeliani on 06.01.24.
//

import SwiftUI
import NetworkManager

final class PopularTVSeriesDetailsViewModel: ObservableObject {
    // MARK: - Porperties
    let networkManager: APIServices
    var tvSeriesID: Int
    @Published var tvSeriesName: String = ""
    @Published var tvSeriesReleaseDate: String = ""
    @Published var tvSeriesOverview: String = ""
    @Published var tvSeriesGenre: [Genre] = []
    @Published var tvSeriesNumberOfSeasons: Int = 1
    @Published var tvSeriesVoteAverage: Double = 1.0
    @Published var formatedGenreString: String = ""
    
    // MARK: - Init
    init(networkManager: APIServices, tvSeriesID: Int) {
        self.networkManager = networkManager
        self.tvSeriesID = tvSeriesID
        Task {
            await fetchTVSeriesData()
            formatedGenreString = tvSeriesGenre.map { String($0.name) }.joined(separator: ",")
        }
    }
    
    // MARK: - Methods
    func fetchTVSeriesData() async {
        let urlString = "https://api.themoviedb.org/3/tv/\(tvSeriesID)?api_key=6eba9c07b10a9dbccd016ffdfea557c8#"
        do {
            let tvSeriesDetailsResponse: PopularTVSeriesDetails = try await networkManager.fetchData(fromURL: urlString)
            await MainActor.run {
                tvSeriesName = tvSeriesDetailsResponse.name
                tvSeriesReleaseDate = tvSeriesDetailsResponse.firstAirDate
                tvSeriesOverview = tvSeriesDetailsResponse.overview
                tvSeriesGenre = tvSeriesDetailsResponse.genres
                tvSeriesNumberOfSeasons = tvSeriesDetailsResponse.numberOfSeasons
                tvSeriesVoteAverage = tvSeriesDetailsResponse.voteAverage
            }
        }
        catch {
            print(error)
        }
    }
}
