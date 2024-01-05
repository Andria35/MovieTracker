//
//  PopularTVSeriesView.swift
//  MovieTracker
//
//  Created by Andria Inasaridze on 05.01.24.
//

import SwiftUI
import NetworkManager

struct PopularTVSeriesView: View {
    // MARK: Properties
    @StateObject var popularTVSeriesViewModel: PopularTVSeriesViewModel
    private let gridColumns = [GridItem(.flexible()), GridItem(.flexible())]
    
    // MARK: Body
    var body: some View {
        VStack {
            HeaderView
            
            PopularTVSeriesScrollView
        }
        .padding()
    }
    
    // MARK: - Views
    private var HeaderView: some View {
        HStack {
            Text("Popular TV Series")
                .font(.system(size: 20))
                .bold()
            Spacer()
        }
    }
    
    private var PopularTVSeriesScrollView: some View {
        ScrollView {
            LazyVGrid(columns: gridColumns, content: {
                PopularTVSeriesGridItemView
            })
        }
    }
    
    private var PopularTVSeriesGridItemView: some View {
        ForEach(popularTVSeriesViewModel.tvSeries) { tvSeries in
            VStack(spacing: 8, content: {
                PopularTVSeriesGridItemComponentView(
                    popularTVSeriesGridItemComponentViewModel: PopularTVSeriesGridItemComponentViewModel(
                        tvSeries: tvSeries,
                        networkManager: popularTVSeriesViewModel.networkManager))
                
                popularTVSeriesNameView(tvSeries)
            })
        }
    }
    
    private func popularTVSeriesNameView(_ tvSeries: PopularTVSeries) -> some View {
        HStack {
            Text("\(tvSeries.name)")
                .font(.system(size: 16))
            Spacer()
        }
    }
}

#Preview {
    PopularTVSeriesView(popularTVSeriesViewModel: PopularTVSeriesViewModel(networkManager: NetworkManager()))
}

