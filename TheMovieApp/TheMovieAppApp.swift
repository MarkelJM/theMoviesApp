//
//  TheMovieAppApp.swift
//  TheMovieApp
//
//  Created by Markel Juaristi on 8/6/23.
//

import SwiftUI

@main
struct TheMovieAppApp: App {
    @StateObject var movieListViewModel = MovieListViewModel()

    var body: some Scene {
        WindowGroup {
            MainTabBarView()
                .environmentObject(movieListViewModel)
        }
    }
}






/*
 //asi funciona bien favourtieslist,cambiar fondo del tabView
@main
struct TheMovieAppApp: App {
    @StateObject var movieListViewModel = MovieListViewModel()

    var body: some Scene {
        WindowGroup {
            TabView {
                MoviesListView()
                    .environmentObject(movieListViewModel)
                    .tabItem {
                        Image(systemName: "film")
                        Text("Movies")
                    }

                FavouritesMoviesListView()
                    .environmentObject(movieListViewModel)
                    .tabItem {
                        Image(systemName: "heart")
                        Text("Favourites")
                    }
            }
        }
    }
}
*/


/*
@main
struct TheMovieAppApp: App {
    @StateObject var movieListViewModel = MovieListViewModel()

    var body: some Scene {
        WindowGroup {
            MainTabBarView()
                .environmentObject(movieListViewModel)
        }
    }
}
*/

/*
 import SwiftUI

 struct MainTabView: View {
     var body: some View {
         TabView {
             MoviesListView()
                 .tabItem {
                     Image(systemName: "film")
                     Text("Movies")
                 }
             
             // Aquí puede agregar su segundo view para los favoritos
             Text("Favoritos")
                 .tabItem {
                     Image(systemName: "heart")
                     Text("Favoritos")
                 }
         }
     }
 }

 struct MainTabView_Previews: PreviewProvider {
     static var previews: some View {
         MainTabView()
     }
 }

 */
