//
//  PopularMoviesView.swift
//  MovieTracker
//
//  Created by Andria Inasaridze on 05.01.24.
//

import SwiftUI

struct PopularMoviesView: View {
    @EnvironmentObject var popularMoviesViewRouter: Router
    @StateObject var popularMoviesViewModel = PopularMoviesViewModel()
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: [GridItem(.flexible(), spacing: 20), GridItem(.flexible(), spacing: 20)], spacing: 20, content: {
                ForEach(popularMoviesViewModel.movies, id: \.id) { movie in
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
                    .onTapGesture {
                        popularMoviesViewRouter.navigate(to: .movieDetails(movie.id))
                    }
                }
            })
            .padding()
        }
        .background(colorScheme == .dark ? .black : .white)
        .navigationTitle("Popular Movies")
    }
}


#Preview {
    PopularMoviesView()
}
