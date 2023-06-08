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
    //Coloreamos las películas según su nota media
    func gradientBackground(forVoteAverage voteAverage: Double) -> LinearGradient {
            switch voteAverage {
            case 0..<5:
                return LinearGradient(gradient: Gradient(colors: [Color.red.opacity(0.5), Color.orange.opacity(0.5)]), startPoint: .top, endPoint: .bottom)
            case 5..<7:
                return LinearGradient(gradient: Gradient(colors: [Color.yellow.opacity(0.5), Color.orange.opacity(0.5)]), startPoint: .top, endPoint: .bottom)
            case 7...10:
                return LinearGradient(gradient: Gradient(colors: [Color.green.opacity(0.5), Color.blue.opacity(0.5)]), startPoint: .top, endPoint: .bottom)
            default:
                return LinearGradient(gradient: Gradient(colors: [Color.gray.opacity(0.5), Color.black.opacity(0.5)]), startPoint: .top, endPoint: .bottom)
            }
        }

    var body: some View {
        ZStack {
            gradientBackground(forVoteAverage: movie.voteAverage).opacity(0.7)
            
            HStack {
                KFImage(movie.posterURL)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 100, height: 100)
                    .cornerRadius(75)

                VStack(alignment: .leading) {
                    Text(movie.title)
                        .font(.custom("Helvetica Neue", size: 20))
                        .foregroundColor(Color.black)
                        .shadow(color: .gray, radius: 2, x: 0, y: 2)

                    Text("Grade: \(movie.voteAverage, specifier: "%.1f")")
                        .font(.custom("Helvetica Neue", size: 20))
                        .foregroundColor(.black)
                    
                }
                Spacer()
            }
            .padding()
        }
        .cornerRadius(10)
        .shadow(color: .gray, radius: 2, x: 0, y: 2)
        .padding(.horizontal)
    }
}


struct MovieRow_Previews: PreviewProvider {
    static var previews: some View {
        let movie = Movie(id: 0, title: "Avengers: Endgame", overview: "Overview", posterPath: "/or06FN3Dka5tukK1e9sl16pB3iy.jpg", voteAverage: 9.8)
        MovieRowView(movie: movie)
    }
}
