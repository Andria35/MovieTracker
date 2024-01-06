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
    @EnvironmentObject private var router: Router
    private let gridColumns = [GridItem(.flexible(), spacing: 20), GridItem(.flexible(), spacing: 20)]
    
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
            PopularTVSeriesGridItemComponentView(
                popularTVSeriesGridItemComponentViewModel: PopularTVSeriesGridItemComponentViewModel(
                    tvSeries: tvSeries,
                    networkManager: popularTVSeriesViewModel.networkManager))
            .onTapGesture {
                router.navigate(to: .popularTVSeriesDetailsView(tvSeriesID: tvSeries.id))
            }
        }
    }
}

#Preview {
    PopularTVSeriesView(popularTVSeriesViewModel: PopularTVSeriesViewModel(networkManager: NetworkManager()))
}

