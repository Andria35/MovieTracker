//
//  PopularTVSeriesDetailsView.swift
//  MovieTracker
//
//  Created by Luka Gazdeliani on 06.01.24.
//

import SwiftUI
import NetworkManager

struct PopularTVSeriesDetailsView: View {
    @StateObject var popularTVSeriesDetailsViewModel: PopularTVSeriesDetailsViewModel
    @EnvironmentObject private var router: Router
    
    var body: some View {
        VStack(spacing: 24) {
            if popularTVSeriesDetailsViewModel.tvSeriesImageBackdropPath != "" {
                PopularTVSeriesDetailsImageComponentView(popularTVSeriesDetailsImageComponentViewModel: PopularTVSeriesDetailsImageComponentViewModel(backdropPath: popularTVSeriesDetailsViewModel.tvSeriesImageBackdropPath, networkManager: NetworkManager()))
            }
            
            VStack(spacing: 12) {
                HStack {
                    Text("\(popularTVSeriesDetailsViewModel.tvSeriesName)")
                        .font(.system(size: 20))
                        .bold()
                    
                    Spacer()
                    
                    Image(systemName: "star.fill")
                        .resizable()
                        .frame(width: 20, height: 20)
                        .foregroundStyle(.yellow)
                    
                    Text("\(String(format: "%.1f", popularTVSeriesDetailsViewModel.tvSeriesVoteAverage))")
                }
                
                HStack {
                    Text("\(popularTVSeriesDetailsViewModel.tvSeriesReleaseDate)")
                        .foregroundStyle(.opacity(0.5))
                    
                    Spacer()
                }
            }
            
            Text("\(popularTVSeriesDetailsViewModel.tvSeriesOverview)")
                .lineLimit(3...5)
            
            VStack(spacing: 12) {
                HStack {
                    Text("Genre: \(popularTVSeriesDetailsViewModel.formatedGenreString)")
                        .foregroundStyle(.opacity(0.5))
                    Spacer()
                }
                
                HStack {
                    Text("Number of Seasons: \(popularTVSeriesDetailsViewModel.tvSeriesNumberOfSeasons)")
                        .foregroundStyle(.opacity(0.5))
                    Spacer()
                }
            }
        }
        .padding()
    }
}
