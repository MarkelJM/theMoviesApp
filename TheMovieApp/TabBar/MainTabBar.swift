//
//  MainTabBar.swift
//  TheMovieApp
//
//  Created by Markel Juaristi on 8/6/23.
//

import SwiftUI

struct MainTabBarView: View {
    @EnvironmentObject var movieListViewModel: MovieListViewModel

    var body: some View {
        TabView {
            MoviesListView()
                .environmentObject(movieListViewModel)
                .tabItem {
                    Image(systemName: "film")
                    Text("Movies")
                }
                .toolbar {
                    ToolbarItem(placement: .bottomBar) {
                        HStack {
                            Spacer()
                            Image(systemName: "film")
                            Text("Movies")
                            Spacer()
                        }
                        .background(Color.red.opacity(0.6))
                    }
                }

            FavouritesMoviesListView()
                .environmentObject(movieListViewModel)
                .tabItem {
                    Image(systemName: "heart")
                    Text("Favourites")
                }
                .toolbar {
                    ToolbarItem(placement: .bottomBar) {
                        HStack {
                            Spacer()
                            Image(systemName: "heart")
                            Text("Favourites")
                            Spacer()
                        }
                        .background(Color.red.opacity(0.6))
                    }
                }
        }
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabBarView()
            .environmentObject(MovieListViewModel())
    }
}

