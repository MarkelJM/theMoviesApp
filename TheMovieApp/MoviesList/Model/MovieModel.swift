//
//  MovieModel.swift
//  TheMovieApp
//
//  Created by Markel Juaristi on 8/6/23.
//

import Foundation

struct MovieListResponse: Codable {
    let page: Int
    let results: [Movie]
    
}


struct Movie: Codable, Identifiable {
    let id: Int
    let title: String
    let overview: String
    let posterPath: String?
    var isFavorite: Bool = false

    enum CodingKeys: String, CodingKey {
        case id
        case title
        case overview
        case posterPath = "poster_path"
    }
    
    var posterURL: URL {
        return URL(string: "https://image.tmdb.org/t/p/w500\(posterPath ?? "")")!
        /*
         Para aclarar, posterPath es la parte de la URL que se obtiene de la API, y luego se combina con la URL base de las imágenes de la API ("https://image.tmdb.org/t/p/w500") para formar la URL completa de la imagen.
         */
    }
}
/*
struct MovieDetail: Codable {
    let id: Int
    let title: String
    let overview: String
    let posterPath: String?
    var isFavorite: Bool = false

    enum CodingKeys: String, CodingKey {
        case id
        case title
        case overview
        case posterPath = "poster_path"
    }
    
    var posterURL: URL {
        return URL(string: "https://image.tmdb.org/t/p/w500\(posterPath ?? "")")!
    }
}
*/
