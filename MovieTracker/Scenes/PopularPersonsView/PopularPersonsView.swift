//
//  PopularPersonsView.swift
//  MovieTracker
//
//  Created by Andria Inasaridze on 05.01.24.
//

import SwiftUI
import NetworkManager

struct PopularPersonsView: View {
    
    // MARK: - Properties
    
    @StateObject var popularPersonsViewModel = PopularPersonsViewModel()
    
    @State var personsImage: Image = Image(systemName: "photo")
    
    private let gridColumns = [GridItem(.flexible()), GridItem(.flexible())]
    
    // MARK: - Body
    
    var body: some View {
        VStack {
            HStack {
                Text("Popular Persons")
                    .font(.system(size: 22))
                Spacer()
            }
            ScrollView {
                LazyVGrid(columns: gridColumns, content: {
                    ForEach(popularPersonsViewModel.popularPersons) { popularPersons in
                        VStack(spacing: 8, content: {
                            AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/w500\(popularPersons.profilePath ?? "")")){ phase in
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
                        })
                    }
                })
                .task {
                    await popularPersonsViewModel.getPopularPersons()
                }
            }
        }
    }
}

#Preview {
    PopularPersonsView()
}

