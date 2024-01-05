//
//  PopularTVSeriesGridItemComponentView.swift
//  MovieTracker
//
//  Created by Luka Gazdeliani on 06.01.24.
//

import SwiftUI

struct PopularTVSeriesGridItemComponentView: View {
    // MARK: - Properties
    @ObservedObject var popularTVSeriesViewModel: PopularTVSeriesViewModel
    @State var tvSeriesImage: Image = Image(systemName: "photo")
    var tvSeries: PopularTVSeries
    
    // MARK: - Body
    var body: some View {
        tvSeriesImage
            .task {
                let fetchedImage = await popularTVSeriesViewModel.fetchImage(urlString: "https://image.tmdb.org/t/p/w500\(tvSeries.backdropPath)")
                await MainActor.run {
                    tvSeriesImage = fetchedImage
                }
            }
    }
}
