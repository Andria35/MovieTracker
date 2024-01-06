//
//  PopularTVSeriesGridItemComponentView.swift
//  MovieTracker
//
//  Created by Luka Gazdeliani on 06.01.24.
//

import SwiftUI

struct PopularTVSeriesGridItemComponentView: View {
    // MARK: - Properties
    @StateObject var popularTVSeriesGridItemComponentViewModel: PopularTVSeriesGridItemComponentViewModel
    
    // MARK: - Body
    var body: some View {
        VStack(spacing: 8) {
            popularTVSeriesGridItemComponentViewModel.tvSeriesImage
                .resizable()
                .frame(height: 249)
                .aspectRatio(contentMode: .fit)
                .clipShape(RoundedRectangle(cornerRadius: 12))
            
            popularTVSeriesNameView(popularTVSeriesGridItemComponentViewModel.tvSeries)
        }
    }
    
    // MARK: - Views
    private func popularTVSeriesNameView(_ tvSeries: PopularTVSeries) -> some View {
        HStack {
            Text("\(tvSeries.name)")
                .font(.system(size: 16))
                .bold()
            Spacer()
        }
    }
}
