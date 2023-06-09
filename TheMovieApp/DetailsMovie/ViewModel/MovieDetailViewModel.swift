//
//  MovieDetailViewModel.swift
//  TheMovieApp
//
//  Created by Markel Juaristi on 8/6/23.
//

import Foundation
import Combine


class MovieDetailViewModel: ObservableObject {
    /* La película cuyos detalles están siendo mostrados. Se actualizará  cuando se recuperen de la API */
    @Published var movie: Movie

    private var movieService: MovieService
    private var cancellables: Set<AnyCancellable> = []


    init(movie: Movie, movieService: MovieService = MovieService()) {
        self.movie = movie
        self.movieService = movieService
        fetchMovieDetail()
    }

    /* Recupera los detalles de la película de la API */
    private func fetchMovieDetail() {
        /* Pide al servicio de películas que recupere los detalles de la película */
        movieService.getMovieDetail(movieId: movie.id)
            /* Se suscribe a la respuesta. */
            .sink { [weak self] completion in
                /* Cuando se complete la operación, comprueba si hubo un error */
                switch completion {
                case .failure(let error):
                    print("Error fetching movie details: \(error)")
                case .finished:
                    break
                }
            } receiveValue: { [weak self] movieDetail in
                DispatchQueue.main.async {
                    self?.movie = movieDetail
                }
            }
            
            .store(in: &cancellables)
    }

    /* Cambia el estado de "favorito" de la película*/
    func toggleFavorite() {
        movie.isFavorite.toggle()
    }

    /* Cuando la instancia de MovieDetailViewModel se desactiva, cancela cualquier operación que falte por hacer */
    deinit {
        for cancellable in cancellables {
            cancellable.cancel()
        }
    }
}

