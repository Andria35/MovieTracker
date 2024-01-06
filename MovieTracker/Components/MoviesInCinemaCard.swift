//
//  MoviesInCinemaCard.swift
//  MovieTracker
//
//  Created by Mariam Mchedlidze on 06.01.24.
//

import SwiftUI

 struct CinemaCard: View {
    @State private var isLoading = true
    var movie: CinemaMovieModel
    var fetchImage: (String) -> String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            
            //MARK: - Image
            
            if isLoading {
                ProgressView()
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                            isLoading = false
                        }
                    }
            } else {
                AsyncImage(url: URL(string: fetchImage(movie.posterPath))) { phase in
                    switch phase {
                    case .success(let image):
                        image
                            .resizable()
                            .scaledToFit()
                            .frame(width: 168, height: 249)
                            .cornerRadius(8)
                        
                    default:
                        Image(systemName: "arrow.clockwise")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 40, height: 40)
                            .cornerRadius(8)
                    }
                }
            }
            
            //MARK: - Title

            Text(movie.title)
                .font(.system(size: 16, weight: .regular))
                .lineLimit(1)
        }
    }
}


