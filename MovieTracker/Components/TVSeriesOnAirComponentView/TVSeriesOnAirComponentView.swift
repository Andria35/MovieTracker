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
    
    var body: some View {
        VStack(alignment: .leading) {
            viewModel.tvSeriesOnAirImage
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 140)
                .clipShape(RoundedRectangle(cornerRadius: 20))

            
            
            Text(viewModel.tvSeriesOnAir.name)
                .lineLimit(1)
                .fontWeight(.semibold)
        }

    }
}

#Preview(traits: .sizeThatFitsLayout) {
    TVSeriesOnAirComponentView(viewModel: TVSeriesOnAirComponentViewModel(networkManager: NetworkManager(), tvSeriesOnAir: TVSeriesOnAirMockData.tvSeriesOnAir))
}
