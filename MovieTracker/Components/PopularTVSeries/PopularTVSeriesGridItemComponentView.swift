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
        popularTVSeriesGridItemComponentViewModel.tvSeriesImage
            .frame(width: 168, height: 249)
            .scaledToFill()
            .clipShape(RoundedRectangle(cornerRadius: 2))
    }
}
