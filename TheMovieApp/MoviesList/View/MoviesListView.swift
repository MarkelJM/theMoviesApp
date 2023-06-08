//
//  MoviesListView.swift
//  TheMovieApp
//
//  Created by Markel Juaristi on 8/6/23.
//

import SwiftUI
import Combine


struct MoviesListView: View {
    /* Usamos environment y no observer para mantener la relación de favoritos y no sean independietes los favoritos de la row y el de las listas*/
    @EnvironmentObject var viewModel: MovieListViewModel

    init() {
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = UIColor.gray
        appearance.titleTextAttributes = [.foregroundColor: UIColor.black]
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.black, .font : UIFont(name: "Helvetica Neue", size: 35)!]
        
        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
    }

    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient(gradient: Gradient(colors: [Color.gray, Color.white]), startPoint: .top, endPoint: .bottom)
                    .edgesIgnoringSafeArea(.all)
                
                VStack {
                    TextField("Search", text: $viewModel.searchTerm)
                        .padding(.leading)
                    
                    ScrollView {
                        LazyVStack {
                            ForEach(viewModel.filteredMovies, id: \.id) { movie in
                                HStack {
                                    Button(action: {
                                        self.viewModel.toggleFavorite(movie: movie)
                                    }) {
                                        Image(systemName: movie.isFavorite ? "heart.fill" : "heart")
                                    }
                                    .buttonStyle(PlainButtonStyle())
                                    
                                    NavigationLink(destination: DetailMovieView(movie: movie).environmentObject(viewModel)) {
                                        MovieRowView(movie: movie)
                                    }
                                }
                                .padding(.horizontal)
                                .background(Color.white.opacity(0.8))
                                .cornerRadius(10)
                                .shadow(color: .gray, radius: 2, x: 0, y: 2)
                                .padding(.vertical, 5)
                            }
                        }
                        .padding(.top)
                    }
                }
                .padding(.horizontal)
            }
            .navigationTitle("Movies")
            .navigationBarTitleDisplayMode(.large)
        }
    }
}


struct MoviesListView_Previews: PreviewProvider {
    static var previews: some View {
        let movies = [
            Movie(id: 0, title: "Avengers: Endgame", overview: "Overview", posterPath: "/or06FN3Dka5tukK1e9sl16pB3iy.jpg", voteAverage: 6.9),
            Movie(id: 1, title: "Black Panther", overview: "Overview", posterPath: "/uxzzxijgPIY7slzFvMotPv8wjKA.jpg", voteAverage: 5.6),
            Movie(id: 2, title: "Spider-Man: Homecoming", overview: "Overview", posterPath: "/c24sv2weTHPsmDa7jEMN0m2P3RT.jpg", voteAverage: 7.98)
        ]
        let viewModel = MovieListViewModel()
        viewModel.movies = movies
        return MoviesListView().environmentObject(viewModel)
    }
}

//DISEÑO SIMPLE:
/*
struct MoviesListView: View {
    @EnvironmentObject var viewModel: MovieListViewModel

    var body: some View {
        NavigationView {
            VStack {
                TextField("Search", text: $viewModel.searchTerm)
                    .padding(.leading)
                List(viewModel.filteredMovies, id: \.id) { movie in
                    HStack {
                        Button(action: {
                            self.viewModel.toggleFavorite(movie: movie)
                        }) {
                            Image(systemName: movie.isFavorite ? "heart.fill" : "heart")
                        }
                        .buttonStyle(PlainButtonStyle())
                        
                        NavigationLink(destination: DetailMovieView(movie: movie).environmentObject(viewModel)) {
                            MovieRowView(movie: movie)
                        }
                    }
                }
                .navigationTitle("Movies")
            }
            
        }
    }
}
*/
