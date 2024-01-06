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
    @Binding var tvSeriesID: Int
    
    var body: some View {
        VStack(spacing: 24) {
            Image(systemName: "photo")
                .resizable()
                .frame(width: .infinity, height: 456)
                .clipShape(RoundedRectangle(cornerRadius: 72))
            
            HStack {
                Text("\(popularTVSeriesDetailsViewModel.tvSeriesName)")
                    .font(.system(size: 20))
                    .bold()
                
                Spacer()
                
                Image(systemName: "star.fill")
                    .resizable()
                    .foregroundStyle(.yellow)
                    .frame(width: 20, height: 20)
                
                Text("\(popularTVSeriesDetailsViewModel.tvSeriesVoteAverage)")
            }
            
            HStack {
                Text("\(popularTVSeriesDetailsViewModel.tvSeriesReleaseDate)")
                    .foregroundStyle(.opacity(0.5))
                
                Spacer()
            }
            
            Text("\(popularTVSeriesDetailsViewModel.tvSeriesOverview)")
            
            HStack {
                Text("Genre: \(popularTVSeriesDetailsViewModel.formatedGenreString)")
                    .foregroundStyle(.opacity(0.5))
                Spacer()
            }
            
            HStack {
                Text("\(popularTVSeriesDetailsViewModel.tvSeriesNumberOfSeasons)")
                    .foregroundStyle(.opacity(0.5))
                Spacer()
            }
        }
    }
}

//#Preview {
//    PopularTVSeriesDetailsView(popularTVSeriesDetailsViewModel: PopularTVSeriesDetailsViewModel(networkManager: NetworkManager(), tvSeriesID: 4191117), tvSeriesID: 4191117)
//}
