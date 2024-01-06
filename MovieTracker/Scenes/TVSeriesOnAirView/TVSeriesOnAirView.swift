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
    private let gridLayout: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]    
    @StateObject var viewModel: TVSeriesOnAirViewModel
    @EnvironmentObject var router: Router
    
    // MARK: - Body
    var body: some View {
        ScrollView {
            tvSeriesOnAirGrid
        }
        .navigationTitle("TV Series On Air")
    }
}

// MARK: - Components
extension TVSeriesOnAirView {
    
    // MARK: - TVSeriesOnAirGrid
    private var tvSeriesOnAirGrid: some View {
        LazyVGrid(columns: gridLayout) {
            ForEach(viewModel.tvShows) { tvShow in
                TVSeriesOnAirComponentView(viewModel: TVSeriesOnAirComponentViewModel(networkManager: NetworkManager(), tvSeriesOnAir: tvShow))
                    .onTapGesture {
                        router.navigate(to: .TVSeriesOnAirDetailsView(id: tvShow.id))
                    }
            }
        }
        .padding()
    }
}

// MARK: - Preview
#Preview {
    NavigationStack {
        TVSeriesOnAirView(viewModel: TVSeriesOnAirViewModel(networkManager: NetworkManager()))
            .environmentObject(Router())
    }
}
