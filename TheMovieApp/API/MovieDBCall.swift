//
//  MovieDBCall.swift
//  TheMovieApp
//
//  Created by Markel Juaristi on 8/6/23.
//

import Foundation
import Combine

/* Clase que proporciona métodos para interactuar con el API de TheMovieDB. */
class MovieService {
    // Propiedades base de la API de TheMovieDB
    private let baseURL = "https://api.themoviedb.org/3"
    private let apiKey = "usar-apiKey-personal" //enlace apiKey personal: https://www.themoviedb.org/settings/api  +información en README.md
    
    
    
    /* Método para obtener la lista de películas más populares*/
    func getMovieList() -> AnyPublisher<MovieListResponse, Error> {
        // Construye la URL completa.
        let urlString = "\(baseURL)/movie/popular?api_key=\(apiKey)&language=es-ES&page=1"
        
        // Comprueba que la URL es válida.
        guard let url = URL(string: urlString) else {
            // Si la URL es inválida, emite un error inmediatamente.
            return Fail(error: URLError(.badURL))
                .eraseToAnyPublisher()
        }
        
        
        return URLSession.shared.dataTaskPublisher(for: url)
            .map { $0.data }
            .decode(type: MovieListResponse.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
    
    
    /* Método para obtener los detalles de una película específica por su ID.*/
    func getMovieDetail(movieId: Int) -> AnyPublisher<Movie, Error> {
        // Construye la URL completa.
        let urlString = "\(baseURL)/movie/\(movieId)?api_key=\(apiKey)&language=es-ES"
        
        // Comprueba que la URL es válida.
        guard let url = URL(string: urlString) else {
            return Fail(error: URLError(.badURL))
                .eraseToAnyPublisher()
        }
        
        
        return URLSession.shared.dataTaskPublisher(for: url)
            .map { $0.data }
            .decode(type: Movie.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
    
    // Función para pasar url al test.
    func getMovieListURLtest() -> URL? {
        return URL(string: "\(baseURL)/movie/popular?api_key=\(apiKey)&language=es-ES&page=1")
    }
}

