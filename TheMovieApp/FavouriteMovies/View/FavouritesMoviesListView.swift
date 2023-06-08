//
//  FavouritesMoviesListView.swift
//  TheMovieApp
//
//  Created by Markel Juaristi on 8/6/23.
//

import SwiftUI

struct FavouritesMoviesListView: View {
    @EnvironmentObject var viewModel: MovieListViewModel

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
                    
                    NavigationLink(destination: DetailMovieView(movie: movie).environmentObject(viewModel)) {
                        MovieRowView(movie: movie)
                    }
                }
            }
            .navigationTitle("Favourites")
        }
    }
}



struct FavouritesMoviesListView_Previews: PreviewProvider {
    static var previews: some View {
        FavouritesMoviesListView()
    }
}
