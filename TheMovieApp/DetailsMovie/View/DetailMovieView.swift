//
//  DetailMovieView.swift
//  TheMovieApp
//
//  Created by Markel Juaristi on 8/6/23.
//


import SwiftUI
import Kingfisher

struct DetailMovieView: View {
    @ObservedObject var viewModel: MovieDetailViewModel

    var body: some View {
        ScrollView {
            VStack {
                KFImage(viewModel.movie.posterURL)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 300)
                
                Text(viewModel.movie.title)
                    .font(.largeTitle)
                    .padding(.top)

                Text(viewModel.movie.overview)
                    .font(.body)
                    .padding()
                
                Button(action: viewModel.toggleFavorite) {
                    Image(systemName: viewModel.movie.isFavorite ? "heart.fill" : "heart")
                        .font(.largeTitle)
                        .padding()
                }
            }
        }
    }
}

struct DetailMovieView_Previews: PreviewProvider {
    static var previews: some View {
        let movie = Movie(id: 0, title: "Avengers: Endgame", overview: "Overview", posterPath: "/or06FN3Dka5tukK1e9sl16pB3iy.jpg")
        let viewModel = MovieDetailViewModel(movie: movie)
        return DetailMovieView(viewModel: viewModel)
    }
}
