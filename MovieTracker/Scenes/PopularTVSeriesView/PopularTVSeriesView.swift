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
    #warning("Divide as components")
        VStack {
            HStack {
                Text("Popular TV Series")
                    .font(.system(size: 20))
                    .bold()
                Spacer()
            }
            
            ScrollView {
                LazyVGrid(columns: gridColumns, content: {
                    ForEach(popularTVSeriesViewModel.tvSeries) { tvSeries in
                        VStack(spacing: 8, content: {
                            PopularTVSeriesGridItemComponentView(popularTVSeriesViewModel: popularTVSeriesViewModel, tvSeries: tvSeries)
                                .frame(width: 168, height: 249)
                                .scaledToFill()
                                .clipShape(RoundedRectangle(cornerRadius: 2))
                            
                            HStack {
                                Text("\(tvSeries.name)")
                                    .font(.system(size: 16))
                                Spacer()
                            }
                        })
                    }
                })
            }
        }
        .padding()
    }
}

#Preview {
    PopularTVSeriesView(popularTVSeriesViewModel: PopularTVSeriesViewModel(networkManager: NetworkManager()))
}

