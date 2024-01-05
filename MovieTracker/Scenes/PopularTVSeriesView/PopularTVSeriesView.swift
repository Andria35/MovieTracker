//
//  PopularTVSeriesView.swift
//  MovieTracker
//
//  Created by Andria Inasaridze on 05.01.24.
//

import SwiftUI
import NetworkManager

struct PopularTVSeriesView: View {
    //MARK: Properties
    @StateObject var popularTVSeriesViewModel: PopularTVSeriesViewModel
    @State var tvSeriesImage: Image = Image(systemName: "photo")
    private let gridColumns = [GridItem(.flexible()), GridItem(.flexible())]
    
    //MARK: Body
    var body: some View {
        VStack {
            Text("Popular TV Series")
                .font(.system(size: 20))
                .bold()
            
            ScrollView {
                LazyVGrid(columns: gridColumns, content: {
                    ForEach(popularTVSeriesViewModel.tvSeries) { tvSeries in
                        VStack(spacing: 8, content: {
                            tvSeriesImage
                                .resizable()
                                .frame(width: 168, height: 249)
                                .clipShape(RoundedRectangle(cornerRadius: 2))
                                .task {
                                    let fetchedImage = await popularTVSeriesViewModel.fetchImage(urlString: "https://image.tmdb.org/t/p/w500\(tvSeries.backdropPath)")
                                    await MainActor.run {
                                        tvSeriesImage = fetchedImage
                                    }
                                }
                            
                            Text("\(tvSeries.name)")
                                .font(.system(size: 16))
                        })
                    }
                })
                .task {
                    await popularTVSeriesViewModel.fetchTVSeriesData()
                }
            }
        }
    }
}

#Preview {
    PopularTVSeriesView(popularTVSeriesViewModel: PopularTVSeriesViewModel(networkManager: NetworkManager()))
}

