//
//  ContentView.swift
//  NetflixClone
//
//  Created by PROGRAMAR on 21/09/20.
//

import SwiftUI

struct ContentView: View {
    
    init(){
        UITabBar.appearance().isTranslucent = false
        UITabBar.appearance().barTintColor = UIColor.black
     
    }
    
    var body: some View {
        
       
        
        TabView{
            HomeView()
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }.tag(0)
            Text("SEARCH")
                .tabItem {
                    Image(systemName: "magnifyingglass")
                    Text("Search")
                }.tag(1)
            Text("DOWNLOAD")
                .tabItem {
                    Image(systemName: "arrow.down.to.line.alt")
                    Text("Downloads")
                }.tag(2)
            Text("Second")
                .tabItem {
                    Image(systemName: "play.rectangle")
                    Text("Coming Soon")
                }.tag(3)
            Text("More")
                .tabItem {
                    Image(systemName: "line.horizontal.3")
                    Text("More")
                }.tag(4)
        }
        .accentColor(.white)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
