//
//  PopularPersonsView.swift
//  MovieTracker
//
//  Created by Andria Inasaridze on 05.01.24.
//

import SwiftUI
import NetworkManager

struct PopularPersonsView: View {
    @StateObject var popularPersonsViewModel = PopularPersonsViewModel()
    @State var personsImage: Image = Image(systemName: "photo")
    private let gridColumns = [GridItem(.flexible()), GridItem(.flexible())]

    var body: some View {
        VStack {
            headerView
            bodyView 
        }
    }

    var headerView: some View {
        HStack {
            Text("Popular Persons")
                .font(.system(size: 22))
            Spacer()
        }
    }

    var bodyView: some View {
        ScrollView {
            LazyVGrid(columns: gridColumns) {
                ForEach(popularPersonsViewModel.popularPersons) { popularPersons in
                    VStack(spacing: 8) {
                        AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/w500\(popularPersons.profilePath ?? "")")) { phase in
                            switch phase {
                            case .success(let image):
                                image
                                    .resizable()
                                    .scaledToFill()
                            case .failure:
                                Text("Image not found")
                            case .empty:
                                Text("Loading...")
                            @unknown default:
                                Text("Loading...")
                            }
                        }

                        HStack {
                            Text("\(popularPersons.name)")
                                .lineLimit(2)
                                .font(.system(size: 20))
                            Spacer()
                        }
                    }
                }
            }
            .task {
                await popularPersonsViewModel.getPopularPersons()
            }
        }
    }
}

#Preview {
    PopularPersonsView()
}
