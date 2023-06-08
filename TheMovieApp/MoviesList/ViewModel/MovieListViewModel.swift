//
//  MovieListViewModel.swift
//  TheMovieApp
//
//  Created by Markel Juaristi on 8/6/23.
//

import Foundation
import Combine

class MovieListViewModel: ObservableObject {
    @Published var movies: [Movie] = []
    @Published var searchTerm: String = ""
    private var movieService: MovieService
    private var cancellables: Set<AnyCancellable> = []

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

    private func fetchMovies() {
        movieService.getMovieList()
            .sink { completion in
                switch completion {
                case .failure(let error):
                    print("Error fetching movies: \(error)")
                case .finished:
                    break
                }
            } receiveValue: { [weak self] movieListResponse in
                DispatchQueue.main.async {
                    self?.movies = movieListResponse.results
                }
            }
            .store(in: &cancellables)
    }

    func toggleFavorite(movie: Movie) {
        if let index = movies.firstIndex(where: { $0.id == movie.id }) {
            movies[index].isFavorite.toggle()
        }
    }
}


