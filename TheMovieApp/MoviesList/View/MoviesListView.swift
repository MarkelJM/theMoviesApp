//
//  MoviesListView.swift
//  TheMovieApp
//
//  Created by Markel Juaristi on 8/6/23.
//

import SwiftUI
import Combine

struct MoviesListView: View {
    @StateObject var viewModel = MovieListViewModel()

    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.movies) { movie in
                    NavigationLink(destination: DetailMovieView(movie: movie)) {
                        MovieRowView(movie: movie, onFavoriteToggle: {
                            viewModel.toggleFavorite(movie: movie)
                        })
                    }
                }
            }
            .navigationTitle("Movies")
        }
    }
}


struct MoviesListView_Previews: PreviewProvider {
    static var previews: some View {
        let movies = [
            Movie(id: 0, title: "Avengers: Endgame", overview: "Overview", posterPath: "/or06FN3Dka5tukK1e9sl16pB3iy.jpg"),
            Movie(id: 1, title: "Black Panther", overview: "Overview", posterPath: "/uxzzxijgPIY7slzFvMotPv8wjKA.jpg"),
            Movie(id: 2, title: "Spider-Man: Homecoming", overview: "Overview", posterPath: "/c24sv2weTHPsmDa7jEMN0m2P3RT.jpg")
        ]
        let viewModel = MovieListViewModel()
        viewModel.movies = movies
        return MoviesListView().environmentObject(viewModel)
    }
}
