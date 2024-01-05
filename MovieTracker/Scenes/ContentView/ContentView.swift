//
//  ContentView.swift
//  MovieTracker
//
//  Created by Andria Inasaridze on 05.01.24.
//

import SwiftUI
import NetworkManager

struct ContentView: View {
    
    // MARK: - Properties
    @StateObject var popularMoviesViewRouter = Router()
    @StateObject var popularPersonsViewRouter = Router()
    @StateObject var popularTVSeriesViewRouter = Router()
    @StateObject var moviesInCinemaViewRouter = Router()
    @StateObject var tvSeriesOnAirViewRouter = Router()
    
    // MARK: - Body
    var body: some View {
        TabView {
            popularMoviesNavigationStack
            popularPersonsNavigationStack
            popularTVSeriesNavigationStack
            moviesInCinemaNavigationStack
            tvSeriesOnAirNavigationStack
        }
    }
}

// MARK: - Components
extension ContentView {
    // MARK: - PopularMoviesNavigationStack
    private var popularMoviesNavigationStack: some View {
        NavigationStack(
            path: $popularMoviesViewRouter.navigationPath) {
                PopularMoviesView()
                    .navigationDestination(for: Router.Destination.self) { destination in
                        switch destination {
                        default:
                            EmptyView()
                        }
                    }
            }
            .tabItem {
                Image(systemName: "movieclapper")
                Text("Movies")
            }
            .environmentObject(popularMoviesViewRouter)
    }
    
    // MARK: - PopularPersonsNavigationStack
    private var popularPersonsNavigationStack: some View {
        NavigationStack(
            path: $popularPersonsViewRouter.navigationPath) {
                PopularPersonsView()
                    .navigationDestination(for: Router.Destination.self) { destination in
                        switch destination {
                        default:
                            EmptyView()
                        }
                    }
            }
            .tabItem {
                Image(systemName: "star")
                Text("Celebrities")
            }
            .environmentObject(popularPersonsViewRouter)
    }
    
    // MARK: - PopularTVSeriesNavigationStack
    private var popularTVSeriesNavigationStack: some View {
        NavigationStack(
            path: $popularTVSeriesViewRouter.navigationPath) {
                PopularTVSeriesView(popularTVSeriesViewModel: PopularTVSeriesViewModel(networkManager: NetworkManager()))
                    .navigationDestination(for: Router.Destination.self) { destination in
                        switch destination {
                        default:
                            EmptyView()
                        }
                    }
            }
            .tabItem {
                Image(systemName: "tv")
                Text("TV Series")
            }
            .environmentObject(popularTVSeriesViewRouter)
    }
    
    // MARK: - MoviesInCinemaNavigationStack
    private var moviesInCinemaNavigationStack: some View {
        NavigationStack(
            path: $moviesInCinemaViewRouter.navigationPath) {
                MoviesInCinemaView()
                    .navigationDestination(for: Router.Destination.self) { destination in
                        switch destination {
                        default:
                            EmptyView()
                        }
                    }
            }
            .tabItem {
                Image(systemName: "popcorn")
                Text("Cinema")
            }
            .environmentObject(moviesInCinemaViewRouter)
    }
    
    // MARK: - TVSeriesOnAirNavigationStack
    private var tvSeriesOnAirNavigationStack: some View {
        NavigationStack(
            path: $tvSeriesOnAirViewRouter.navigationPath) {
                TVSeriesOnAirView()
                    .navigationDestination(for: Router.Destination.self) { destination in
                        switch destination {
                        default:
                            EmptyView()
                        }
                    }
            }.tabItem {
                Image(systemName: "play.tv")
                Text("On Air")
            }
            .environmentObject(tvSeriesOnAirViewRouter)
    }
}

// MARK: - Preview
#Preview {
    ContentView()
        .preferredColorScheme(.dark)
}
