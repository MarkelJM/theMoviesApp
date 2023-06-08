//
//  ContentView.swift
//  TheMovieApp
//
//  Created by Markel Juaristi on 8/6/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


/*
 import SwiftUI

 @main
 struct TheMovieAppApp: App {
     var body: some Scene {
         WindowGroup {
             MainTabView()
         }
     }
 }

 */
