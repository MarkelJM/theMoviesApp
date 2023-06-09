//
//  MoviesListView.swift
//  TheMovieApp
//
//  Created by Markel Juaristi on 8/6/23.
//

import SwiftUI
import Combine


struct MoviesListView: View {
    /* Usamos environment y no observer para mantener la relación de favoritos y no sean independietes los favoritos de la row y el de las listas*/
    @EnvironmentObject var viewModel: MovieListViewModel

    init() {
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = UIColor.black  // Color de fondo de la barra de navegación
        appearance.titleTextAttributes = [.foregroundColor: UIColor.white]  // Color del texto
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white, .font : UIFont(name: "Helvetica Neue", size: 35)!]

        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
    }


    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient(gradient: Gradient(colors: [Color.black, Color.gray]), startPoint: .top, endPoint: .bottom)
                        .edgesIgnoringSafeArea(.all)
                    
                    VStack {
                        TextField("Search", text: $viewModel.searchTerm)
                            .padding(.leading)
                            .background(Color.white)
                            .cornerRadius(10)
                            .padding(.all)  
                    
                    ScrollView {
                        /* LazyVSatck espera la creación de subvistas hasta que son necesarias-> teóricamente mejorar el rendimiento*/
                        LazyVStack {
                            ForEach(viewModel.filteredMovies, id: \.id) { movie in
                                HStack {
                                    Button(action: {
                                        self.viewModel.toggleFavorite(movie: movie)
                                    }) {
                                        Image(systemName: movie.isFavorite ? "heart.fill" : "heart")
                                    }
                                    /* La clave para que al pulsar el corazon no se active el detalle y separar boton y Row, aun y estando dentro del mismos HStack*/
                                    .buttonStyle(PlainButtonStyle())
                                    
                                    NavigationLink(destination: DetailMovieView(movie: movie).environmentObject(viewModel)) {
                                        MovieRowView(movie: movie)
                                    }
                                }
                                .padding(.horizontal)
                                .background(Color.white.opacity(0.8))
                                .cornerRadius(10)
                                .shadow(color: .gray, radius: 2, x: 0, y: 2)
                                .padding(.vertical, 5)
                            }
                        }
                        .padding(.top)
                    }
                }
                .padding(.horizontal)
            }
            .navigationTitle("Movies")
            .navigationBarTitleDisplayMode(.large)
        }
    }
}


struct MoviesListView_Previews: PreviewProvider {
    static var previews: some View {
        let movies = [
            Movie(id: 0, title: "Avengers: Endgame", overview: "Overview", posterPath: "/or06FN3Dka5tukK1e9sl16pB3iy.jpg", voteAverage: 6.9),
            Movie(id: 1, title: "Black Panther", overview: "Overview", posterPath: "/uxzzxijgPIY7slzFvMotPv8wjKA.jpg", voteAverage: 5.6),
            Movie(id: 2, title: "Spider-Man: Homecoming", overview: "Overview", posterPath: "/c24sv2weTHPsmDa7jEMN0m2P3RT.jpg", voteAverage: 7.98)
        ]
        let viewModel = MovieListViewModel()
        viewModel.movies = movies
        return MoviesListView().environmentObject(viewModel)
    }
}

//DISEÑO SIMPLE:
/*
struct MoviesListView: View {
    @EnvironmentObject var viewModel: MovieListViewModel

    var body: some View {
        NavigationView {
            VStack {
                TextField("Search", text: $viewModel.searchTerm)
                    .padding(.leading)
                List(viewModel.filteredMovies, id: \.id) { movie in
                    HStack {
                        Button(action: {
                            self.viewModel.toggleFavorite(movie: movie)
                        }) {
                            Image(systemName: movie.isFavorite ? "heart.fill" : "heart")
                        }
                        .buttonStyle(PlainButtonStyle())
                        
                        NavigationLink(destination: DetailMovieView(movie: movie).environmentObject(viewModel)) {
                            MovieRowView(movie: movie)
                        }
                    }
                }
                .navigationTitle("Movies")
            }
            
        }
    }
}
*/
