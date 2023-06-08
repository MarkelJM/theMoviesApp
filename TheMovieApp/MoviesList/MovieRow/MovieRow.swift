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

    var body: some View {
        HStack {
            KFImage(movie.posterURL)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 100, height: 100)
            
            VStack(alignment: .leading) {
                Text(movie.title)
                    .font(.headline)
                Text("Grade: \(movie.voteAverage, specifier: "%.1f")")
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            
            Spacer()
        }
    }
}


struct MovieRow_Previews: PreviewProvider {
    static var previews: some View {
        let movie = Movie(id: 0, title: "Avengers: Endgame", overview: "Overview", posterPath: "/or06FN3Dka5tukK1e9sl16pB3iy.jpg", voteAverage: 9.8)
        MovieRowView(movie: movie)
    }
}

