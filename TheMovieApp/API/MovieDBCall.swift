//
//  MovieDBCall.swift
//  TheMovieApp
//
//  Created by Markel Juaristi on 8/6/23.
//

import Foundation
import Combine

class MovieService {
    // Propiedades base de la API de TheMovieDB
    private let baseURL = "https://api.themoviedb.org/3"
    private let apiKey = "012fcb9b4d3ae68253e49923b9a47605"
    
    // Función para obtener la lista de películas más populares
    // En lugar de usar un completion handler, devolvemos un AnyPublisher
    // que emite una MovieListResponse y puede fallar con un Error
    func getMovieList() -> AnyPublisher<MovieListResponse, Error> {
        // Construimos la URL completa
        let urlString = "\(baseURL)/movie/popular?api_key=\(apiKey)&language=es-ES&page=1"
        
        // Comprobamos que la URL es válida
        guard let url = URL(string: urlString) else {
            // Si la URL es inválida, emitimos un error
            return Fail(error: URLError(.badURL))
                .eraseToAnyPublisher()
        }
        
        // Creamos un data task publisher para la URL
        // Mapeamos para extraer solo los datos de la respuesta
        // Intentamos decodificar los datos en un MovieListResponse
        // Recibimos en el hilo principal
        // Y finalmente convertimos el resultado en un AnyPublisher
        return URLSession.shared.dataTaskPublisher(for: url)
            .map { $0.data }
            .decode(type: MovieListResponse.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
    
    
    func getMovieDetail(movieId: Int) -> AnyPublisher<MovieDetail, Error> {
        // Construimos la URL completa
        let urlString = "\(baseURL)/movie/\(movieId)?api_key=\(apiKey)&language=es-ES"
        
        // Comprobamos que la URL es válida
        guard let url = URL(string: urlString) else {
            // Si la URL es inválida, emitimos un error inmediatamente
            return Fail(error: URLError(.badURL))
                .eraseToAnyPublisher()
        }
        
        // Creamos un data task publisher para la URL
        // Mapeamos para extraer solo los datos de la respuesta
        // Intentamos decodificar los datos en un MovieDetail
        // Recibimos en el hilo principal
        // Y finalmente convertimos el resultado en un AnyPublisher
        return URLSession.shared.dataTaskPublisher(for: url)
            .map { $0.data }
            .decode(type: MovieDetail.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}
