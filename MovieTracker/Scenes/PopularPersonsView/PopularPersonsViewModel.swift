//
//  PopularPersonsViewModel.swift
//  MovieTracker
//
//  Created by salome on 07.01.24.
//

import NetworkManager
import Foundation

final class PopularPersonsViewModel: ObservableObject {
    //MARK: - Properties
    @Published var popularPersons: [PopularPerson] = []
    private let networkManager = NetworkManager()
    
    // MARK: - Network Calls
    
    init() {
        Task {
            await getPopularPersons()
        }
    }
    
    func getPopularPersons() async {
        let apiKey = "70dce981525cd8cfbfe0d94053fda913"
        let urlString = "https://api.themoviedb.org/3/person/popular?api_key=\(apiKey)"
        
        do {
            if let response: PopularPersonsResponse = try await networkManager.fetchData(fromURL: urlString) {
                await MainActor.run {
                    popularPersons = response.results
                }
            }
        } catch {
            print(error)
        }
    }
}
