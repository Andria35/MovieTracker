//
//  TVSeriesOnAirComponentView.swift
//  MovieTracker
//
//  Created by Andria Inasaridze on 06.01.24.
//

import SwiftUI
import NetworkManager

struct TVSeriesOnAirComponentView: View {
    
    // MARK: - Properties
    @StateObject var viewModel: TVSeriesOnAirComponentViewModel
    
    // MARK: - Body
    var body: some View {
        VStack(alignment: .leading) {
            viewModel.tvSeriesOnAirImage
                .resizable()
                .aspectRatio(contentMode: .fit)
            
            Text(viewModel.tvSeriesOnAir.name)
                .lineLimit(1)
                .fontWeight(.semibold)
        }
    }
}

// MARK: - Preview
#Preview(traits: .sizeThatFitsLayout) {
    TVSeriesOnAirComponentView(viewModel: TVSeriesOnAirComponentViewModel(networkManager: NetworkManager(), tvSeriesOnAir: TVSeriesOnAirMockData.tvSeriesOnAir))
}
