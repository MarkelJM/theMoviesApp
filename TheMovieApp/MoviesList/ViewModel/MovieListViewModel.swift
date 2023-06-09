//
//  MovieListViewModel.swift
//  TheMovieApp
//
//  Created by Markel Juaristi on 8/6/23.
//

import Foundation
import Combine


class MovieListViewModel: ObservableObject {
    /* Lista de películas que se actualiza con los datos recuperados de la API */
    @Published var movies: [Movie] = []
    @Published var searchTerm: String = ""
    
    /*  para interactuar con la API de TheMovieDB */
    private var movieService: MovieService
    
    /*  conjunto de objetos AnyCancellable que representan las operaciones en curso*/
    private var cancellables: Set<AnyCancellable> = []

    //Buscador de películas
    var filteredMovies: [Movie] {
        if searchTerm.isEmpty {
            return movies
        } else {

            return movies.filter { $0.title.lowercased().contains(searchTerm.lowercased()) }
        }
    }


    init(movieService: MovieService = MovieService()) {
        self.movieService = movieService
        fetchMovies()
    }

    /* Trae las películas de la API */
    private func fetchMovies() {
        /* Pide al servicio de películas que recupere la lista de películas */
        movieService.getMovieList()
            /* Se suscribe a la respuesta */
            .sink { completion in
                /* Cuando se complete la operación, comprueba si hubo un error */
                switch completion {
                case .failure(let error):
                    print("Error fetching movies: \(error)")
                case .finished:
                    break
                }
            } receiveValue: { [weak self] movieListResponse in
                /* Cuando recibe los datos, los guarda en la propiedad movies */
                DispatchQueue.main.async {
                    self?.movies = movieListResponse.results
                }
            }
            /* Guarda la suscripción para que no se cancele demasiado rápido */
            .store(in: &cancellables)
    }

    /* Cambia el estado de "favorito" de una película */
    func toggleFavorite(movie: Movie) {
        /* Busca la película en la lista */
        if let index = movies.firstIndex(where: { $0.id == movie.id }) {
            /* Si la encuentra, cambia el estado de isFavorite */
            movies[index].isFavorite.toggle()
        }
    }
}


