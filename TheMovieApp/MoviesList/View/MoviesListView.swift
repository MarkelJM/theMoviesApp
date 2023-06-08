//
//  MoviesListView.swift
//  TheMovieApp
//
//  Created by Markel Juaristi on 8/6/23.
//

import SwiftUI
import Combine

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

