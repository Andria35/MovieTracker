//
//  MoviesInCinemaCardList.swift
//  MovieTracker
//
//  Created by Mariam Mchedlidze on 06.01.24.
//

import SwiftUI

struct MovieList: View {
    var movies: [CinemaMovieModel]
    var fetchImage: (String) -> String
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Header()
                GridViewCinema(movies: movies, fetchImage: fetchImage)
            }
        }.padding(24)
    }
    
    //MARK: - Header
    
    private struct Header: View {
        var body: some View {
            Text("Movies in Cinema")
                .font(.system(size: 20, weight: .medium))
        }
    }
    
    //MARK: - Grid

    private struct GridViewCinema: View {
        @EnvironmentObject var CinemaMoviesViewRouter: Router
        let movies: [CinemaMovieModel]
        let columns: [GridItem] = Array(repeating: .init(.flexible()), count: 2)
        var fetchImage: (String) -> String
        
        var body: some View {
            LazyVGrid(columns: columns, spacing: 16) {
                ForEach(movies) { movie in
                    CinemaCard(movie: movie, fetchImage: fetchImage)
                        .onTapGesture {
                            CinemaMoviesViewRouter.navigate(to: .CinemaMoviesDetailView(movie.id))
                        }
                }
            }
        }
    }
}
    
