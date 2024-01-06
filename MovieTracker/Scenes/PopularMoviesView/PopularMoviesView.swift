//
//  PopularMoviesView.swift
//  MovieTracker
//
//  Created by Andria Inasaridze on 05.01.24.
//

import SwiftUI

struct PopularMoviesView: View {
    @StateObject var popularMoviesViewModel = PopularMoviesViewModel()
    @EnvironmentObject var popularMoviesViewRouter: Router
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: [GridItem(.flexible(), spacing: 20), GridItem(.flexible(), spacing: 20)], spacing: 20, content: {
                ForEach(popularMoviesViewModel.movies, id: \.id) { movie in
                    PopularMoviesGridItemComponentView(movie: movie)
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
