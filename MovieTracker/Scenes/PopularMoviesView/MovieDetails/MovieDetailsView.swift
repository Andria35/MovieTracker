//
//  MovieDetailsView.swift
//  MovieTracker
//
//  Created by Sofo Machurishvili on 06.01.24.
//

import SwiftUI

struct MovieDetailsView: View {
    // MARK: - Properties
    @StateObject var movieDetailsViewModel: MovieDetailsViewModel
    
    // MARK: - Body
    var body: some View {
        ScrollView {
            VStack {
                AsyncImage(url: URL(string: MovieHelper.constructFullImageUrl(imageUrl: movieDetailsViewModel.movieDetails?.posterPath ?? ""))) { phase in
                    switch phase {
                    case .success(let image):
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 393, height: 456)
                            .clipShape(RoundedRectangle(cornerRadius: 30))
                    default: ProgressView()
                    }
                }
                
                Text(movieDetailsViewModel.movieDetails?.title ?? "")
                    .padding()
                
                VStack {
                    Text(movieDetailsViewModel.movieDetails?.overview ?? "")
                        .padding()
                    
                    Text("Release date: \(movieDetailsViewModel.movieDetails?.releaseDate ?? "")")
                }
                .padding(.horizontal, 10)
                
                Spacer()
            }
            
            Spacer()
        }
        
    }
}
