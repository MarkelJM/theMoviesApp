//
//  MovieDetailViewModel.swift
//  TheMovieApp
//
//  Created by Markel Juaristi on 8/6/23.
//

import Foundation
import Combine

class MovieDetailViewModel: ObservableObject {
    @Published var movie: Movie
    private var movieService: MovieService
    private var cancellables: Set<AnyCancellable> = []

    init(movie: Movie, movieService: MovieService = MovieService()) {
        self.movie = movie
        self.movieService = movieService
        fetchMovieDetail()
    }

    private func fetchMovieDetail() {
        movieService.getMovieDetail(movieId: movie.id)
            .sink { [weak self] completion in
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

    func toggleFavorite() {
        movie.isFavorite.toggle()
    }

    deinit {
        for cancellable in cancellables {
            cancellable.cancel()
        }
    }
}

