//
//  DetailMovieView.swift
//  TheMovieApp
//
//  Created by Markel Juaristi on 8/6/23.
//


import SwiftUI
import Kingfisher

struct DetailMovieView: View {
    /* En lugar de pasar los datos a través de un inicializador o como una variable de estado, puedes insertarlos en el entorno de una vista y las vistas dentro de ese entorno pueden tener acceso a esos datos*/
    @EnvironmentObject var viewModel: MovieListViewModel
    /* son una manera de hacer que los datos sean reactivos*/
    @State var movie: Movie

    var body: some View {
        ScrollView {
            VStack {
                KFImage(movie.posterURL)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 300)
                
                Text(movie.title)
                    .font(.largeTitle)
                    .padding(.top)

                Text(movie.overview)
                    .font(.body)
                    .padding()
                
                Button(action: {
                    viewModel.toggleFavorite(movie: movie)
                    self.movie.isFavorite.toggle()
                }) {
                    Image(systemName: movie.isFavorite ? "heart.fill" : "heart")
                        .font(.largeTitle)
                        .padding()
                }
            }
        }
    }
}

struct DetailMovieView_Previews: PreviewProvider {
    static var previews: some View {
        let movie = Movie(id: 0, title: "Avengers: Endgame", overview: "Overview", posterPath: "/or06FN3Dka5tukK1e9sl16pB3iy.jpg", voteAverage: 6.99)
        let viewModel = MovieListViewModel()
        return DetailMovieView(movie: movie).environmentObject(viewModel)
    }
}
