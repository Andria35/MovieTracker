//
//  TVSeriesOnAirView.swift
//  MovieTracker
//
//  Created by Andria Inasaridze on 05.01.24.
//

import SwiftUI
import NetworkManager

struct TVSeriesOnAirView: View {
    
    // MARK: - Properties
    @StateObject var viewModel: TVSeriesOnAirViewModel
    private let gridLayout: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    // MARK: - Body
    var body: some View {
        ScrollView {
            LazyVGrid(columns: gridLayout) {
                ForEach(viewModel.tvShows) { tvShow in
                    TVSeriesOnAirComponentView(viewModel: TVSeriesOnAirComponentViewModel(networkManager: NetworkManager(), tvSeriesOnAir: tvShow))
                }

            }

        }
    }
}

#Preview {
    TVSeriesOnAirView(viewModel: TVSeriesOnAirViewModel(networkManager: NetworkManager()))
}
