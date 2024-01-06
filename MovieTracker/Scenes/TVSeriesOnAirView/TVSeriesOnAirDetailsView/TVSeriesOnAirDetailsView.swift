//
//  TVSeriesOnAirDetailsView.swift
//  MovieTracker
//
//  Created by Andria Inasaridze on 06.01.24.
//

import SwiftUI
import NetworkManager

struct TVSeriesOnAirDetailsView: View {
    
    // MARK: - Properties
    @StateObject var viewModel: TVSeriesOnAirDetailsViewModel
    
    // MARK: - Body
    var body: some View {
        VStack {
            tvSeriesOnAirDetailsImage
            additionalInfoVStack
            Spacer()
        }
        .padding(.horizontal)
    }
}

// MARK: - Components
extension TVSeriesOnAirDetailsView {
    
    // MARK: - TVSeriesOnAirDetailsImage
    private var tvSeriesOnAirDetailsImage: some View {
        viewModel.tvSeriesOnAirImage
            .resizable()
            .frame(width: 300, height: 250)
            .aspectRatio(contentMode: .fit)
            .clipShape(RoundedRectangle(cornerRadius: 20))
    }
    
    // MARK: - AdditionalInfoVStack
    private var additionalInfoVStack: some View {
        VStack(alignment: .leading) {
            Text("\(viewModel.name)")
                .font(.title)
            Divider()
            Text("Overview: \(viewModel.overview)")
                .lineLimit(3)
                .font(.subheadline)
            Divider()
            Text("Seasons: \(viewModel.numberOfSeasons)")
                .font(.callout)
            Divider()
            Text("Episodes: \(viewModel.numberOfEpisodes)")
                .font(.callout)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .fontWeight(.semibold)
    }
}

// MARK: - Preview
#Preview {
    TVSeriesOnAirDetailsView(viewModel: TVSeriesOnAirDetailsViewModel(id: TVSeriesOnAirMockData.tvSeriesOnAir.id, networkManager: NetworkManager()))
}
