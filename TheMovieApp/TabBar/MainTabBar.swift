//
//  MainTabBar.swift
//  TheMovieApp
//
//  Created by Markel Juaristi on 8/6/23.
//

import SwiftUI

import SwiftUI

struct MainTabBarView: View {
    var body: some View {
        TabView {
            MoviesListView()
                .tabItem {
                    Image(systemName: "film")
                    Text("Movies")
                }

            FavouritesMoviesListView()
                .tabItem {
                    Image(systemName: "heart.fill")
                    Text("Favorites")
                }
        }
    }
}


struct MainTabBar_Previews: PreviewProvider {
    static var previews: some View {
        MainTabBarView()
    }
}
