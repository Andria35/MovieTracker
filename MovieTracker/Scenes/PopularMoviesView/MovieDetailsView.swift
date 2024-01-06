//
//  MovieDetailsView.swift
//  MovieTracker
//
//  Created by Sofo Machurishvili on 06.01.24.
//

import SwiftUI

struct MovieDetailsView: View {
    @StateObject var movieDetailsViewModel: MovieDetailsViewModel
    
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: MovieHelper.constructFullImageUrl(imageUrl: movieDetailsViewModel.movieDetails?.posterPath ?? ""))) { phase in
                switch phase {
                case .success(let image):
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: 393, height: 384)
                        .background(
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 393, height: 456)
                                .clipped()
                        )
                        .cornerRadius(72)
                default: ProgressView()
                }
            }
            
            Text(movieDetailsViewModel.movieDetails?.title ?? "")
            
            Spacer()
        }
        .ignoresSafeArea(.all)
        .padding(.top, -72)
        
        Spacer()
    }
}
