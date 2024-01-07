//
//  MoviesInCinemaView.swift
//  MovieTracker
//
//  Created by Andria Inasaridze on 05.01.24.
//

import SwiftUI

struct MoviesInCinemaView: View {
    @ObservedObject var viewModel = MovieInCinemaViewModel()
    
    var body: some View {
        MovieList(movies: viewModel.movies, fetchImage: viewModel.fetchCinemaImage)
    }
}

struct MoviesInCinemaView_Previews: PreviewProvider {
    static var previews: some View {
        MoviesInCinemaView()
    }
}
