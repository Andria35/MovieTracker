//
//  PopularTVSeriesDetailsImageComponentView.swift
//  MovieTracker
//
//  Created by Luka Gazdeliani on 06.01.24.
//

import SwiftUI

struct PopularTVSeriesDetailsImageComponentView: View {
    // MARK: - Properties
    @StateObject var popularTVSeriesDetailsImageComponentViewModel: PopularTVSeriesDetailsImageComponentViewModel
    
    // MARK: - Body
    var body: some View {
        popularTVSeriesDetailsImageComponentViewModel.tvSeriesImage
            .resizable()
            .frame(width: 400, height: 400)
            .scaledToFill()
            .clipShape(RoundedRectangle(cornerRadius: 72))
    }
}
