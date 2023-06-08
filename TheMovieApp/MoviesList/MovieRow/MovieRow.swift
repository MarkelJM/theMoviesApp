//
//  MovieRow.swift
//  TheMovieApp
//
//  Created by Markel Juaristi on 8/6/23.
//


import SwiftUI
import Kingfisher

struct MovieRowView: View {
    let movie: Movie
    let onFavoriteToggle: () -> Void

    var body: some View {
        HStack {
            KFImage(movie.posterURL)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 100, height: 100)
            
            Text(movie.title)
            
            Spacer()
            
            Button(action: onFavoriteToggle) {
                Image(systemName: movie.isFavorite ? "heart.fill" : "heart")
            }
        }
    }
}


struct MovieRow_Previews: PreviewProvider {
    static var previews: some View {
        let movie = Movie(id: 0, title: "Avengers: Endgame", overview: "Overview", posterPath: "/or06FN3Dka5tukK1e9sl16pB3iy.jpg")
        MovieRowView(movie: movie, onFavoriteToggle: {})
    }
}

