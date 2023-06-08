//
//  MainTabBar.swift
//  TheMovieApp
//
//  Created by Markel Juaristi on 8/6/23.
//

import SwiftUI

struct MainTabBarView: View {
    var body: some View {
        TabView {
            MoviesListView()
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
                        .background(Color.red)
                    }
                }
            
            Text("Favoritos")
                .tabItem {
                    Image(systemName: "heart")
                    Text("Favoritos")
                }
                .toolbar {
                    ToolbarItem(placement: .bottomBar) {
                        HStack {
                            Spacer()
                            Image(systemName: "heart")
                            Text("Favoritos")
                            Spacer()
                        }
                        .background(Color.red)
                    }
                }
        }
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabBarView()
    }
}

