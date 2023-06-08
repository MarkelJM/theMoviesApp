//
//  DetailMovieView.swift
//  TheMovieApp
//
//  Created by Markel Juaristi on 8/6/23.
//


import SwiftUI
import Kingfisher

struct DetailMovieView: View {
    let movie: Movie

    var body: some View {
        VStack {
            KFImage(movie.posterURL)
                .resizable()
                .aspectRatio(contentMode: .fit)
            
            Text(movie.title)
            Text(movie.overview)
        }
        .padding()
        .navigationTitle(movie.title)
    }
}


struct DetailMovieView_Previews: PreviewProvider {
    static var previews: some View {
        DetailMovieView()
    }
}
