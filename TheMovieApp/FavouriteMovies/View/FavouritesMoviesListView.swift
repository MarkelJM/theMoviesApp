//
//  FavouritesMoviesListView.swift
//  TheMovieApp
//
//  Created by Markel Juaristi on 8/6/23.
//

import SwiftUI


struct FavouritesMoviesListView: View {
    @ObservedObject var viewModel: MovieListViewModel = MovieListViewModel()

    var body: some View {
        NavigationView {
            List(viewModel.movies.filter({ $0.isFavorite }), id: \.id) { movie in
                HStack {
                    Button(action: {
                        self.viewModel.toggleFavorite(movie: movie)
                    }) {
                        Image(systemName: movie.isFavorite ? "heart.fill" : "heart")
                    }
                    .buttonStyle(PlainButtonStyle())
                        
                    NavigationLink(destination: DetailMovieView(viewModel: MovieDetailViewModel(movie: movie))) {
                        MovieRowView(movie: movie)
                    }
                }
            }
            .navigationTitle("Favorites")
        }
    }
}


struct FavouritesMoviesListView_Previews: PreviewProvider {
    static var previews: some View {
        FavouritesMoviesListView()
    }
}
