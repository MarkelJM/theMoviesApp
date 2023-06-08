//
//  MovieListViewModel.swift
//  TheMovieApp
//
//  Created by Markel Juaristi on 8/6/23.
//

import Foundation
import Combine

class MovieListViewModel: ObservableObject {
    @Published var movies = [Movie]()
    private var cancellables = Set<AnyCancellable>()

    init() {
        fetchMovies()
    }

    private func fetchMovies() {
        MovieService().getMovieList()
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }, receiveValue: { [weak self] movieListResponse in
                self?.movies = movieListResponse.results
            })
            .store(in: &cancellables)
    }

    func toggleFavorite(movie: Movie) {
        if let index = movies.firstIndex(where: { $0.id == movie.id }) {
            movies[index].isFavorite.toggle()
        }
    }
}

