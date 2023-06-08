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
    
    init() {
        UITabBar.appearance().barTintColor = UIColor.systemPurple //no consigo que se muestre
        
    }

    var body: some Scene {
        WindowGroup {
            MainTabBarView()
                .environmentObject(movieListViewModel)
        }
    }
}







