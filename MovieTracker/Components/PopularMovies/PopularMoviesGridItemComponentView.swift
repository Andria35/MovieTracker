//
//  PopularMoviesGridItemComponentView.swift
//  MovieTracker
//
//  Created by Sofo Machurishvili on 06.01.24.
//

import SwiftUI

struct PopularMoviesGridItemComponentView: View {
    // MARK: - Properties
    @Environment(\.colorScheme) var colorScheme
    
    let movie: MovieModel
    
    // MARK: - Body
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: MovieHelper.constructFullImageUrl(imageUrl: movie.posterPath))) { phase in
                switch phase {
                case .success(let image):
                    image
                        .resizable()
                        .scaledToFit()
                    
                default: ProgressView()
                }
            }
            
            Text(movie.title + "\n")
                .lineLimit(2)
                .foregroundStyle(colorScheme == .dark ? .white : .black)
        }
    }
}

// MARK: - Preview
#Preview {
    PopularMoviesGridItemComponentView(movie: MovieModel(id: 1, title: "Movie", posterPath: "", overview: "Overview", releaseDate: "Date"))
}
