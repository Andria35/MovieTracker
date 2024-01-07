//
//  PopularTVSeriesDetailsView.swift
//  MovieTracker
//
//  Created by Luka Gazdeliani on 06.01.24.
//

import SwiftUI
import NetworkManager

struct PopularTVSeriesDetailsView: View {
    // MARK: Properties
    @StateObject var popularTVSeriesDetailsViewModel: PopularTVSeriesDetailsViewModel
    @EnvironmentObject private var router: Router
    
    // MARK: - Body
    var body: some View {
        ScrollView {
            VStack(spacing: 24) {
                if popularTVSeriesDetailsViewModel.fetchedTVSeriesDetailsData.tvSeriesImageBackdropPath != "" {
                    PopularTVSeriesDetailsImageComponentView(
                        popularTVSeriesDetailsImageComponentViewModel: PopularTVSeriesDetailsImageComponentViewModel(
                            backdropPath: popularTVSeriesDetailsViewModel.fetchedTVSeriesDetailsData.tvSeriesImageBackdropPath,
                            networkManager: NetworkManager()))
                }
                
                VStack(spacing: 12) {
                    HStack {
                        NameView
                        
                        Spacer()
                        
                        RatingView
                    }
                    
                    ReleaseDateView
                }
                
                Text("\(popularTVSeriesDetailsViewModel.fetchedTVSeriesDetailsData.tvSeriesOverview)")
                    .lineLimit(3...5)
                
                VStack(spacing: 12) {
                    GenreView
                    
                    NumberOfSeasonsView
                }
            }
        }
        .padding()
    }
    
    // MARK: - Views
    private var NameView: some View {
        Text("\(popularTVSeriesDetailsViewModel.fetchedTVSeriesDetailsData.tvSeriesName)")
            .font(.system(size: 20))
            .bold()
    }
    
    private var RatingView: some View {
        HStack {
            Image(systemName: "star.fill")
                .resizable()
                .frame(width: 20, height: 20)
                .foregroundStyle(.yellow)
            
            Text("\(String(format: "%.1f", popularTVSeriesDetailsViewModel.fetchedTVSeriesDetailsData.tvSeriesVoteAverage))")
        }
    }
    
    private var ReleaseDateView: some View {
        HStack {
            Text("\(popularTVSeriesDetailsViewModel.fetchedTVSeriesDetailsData.tvSeriesReleaseDate)")
                .foregroundStyle(.opacity(0.5))
            
            Spacer()
        }
    }
    
    private var GenreView: some View {
        HStack {
            Text("Genre: \(popularTVSeriesDetailsViewModel.fetchedTVSeriesDetailsData.formatedGenreString)")
                .foregroundStyle(.opacity(0.5))
            Spacer()
        }
    }
    
    private var NumberOfSeasonsView: some View {
        HStack {
            Text("Number of Seasons: \(popularTVSeriesDetailsViewModel.fetchedTVSeriesDetailsData.tvSeriesNumberOfSeasons)")
                .foregroundStyle(.opacity(0.5))
            Spacer()
        }
    }
}
