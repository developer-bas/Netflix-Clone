//
//  ContentView.swift
//  NetflixClone
//
//  Created by PROGRAMAR on 21/09/20.
//

import SwiftUI

struct ContentView: View {
    
    @State private var showPreviewFullScreen = false
    @State private var previewStartingIndex : Int = 0
    @State private var previewCurrentPos : CGFloat = 1000
    
    let screen = UIScreen.main.bounds
    
    init(){
        UITabBar.appearance().isTranslucent = false
        UITabBar.appearance().barTintColor = UIColor.black
     
    }
    
    var body: some View {
        
       
        
        ZStack {
            TabView{
                HomeView(showPreviewFullScreen: $showPreviewFullScreen, previewStartingIndex: $previewStartingIndex)
                    .tabItem {
                        Image(systemName: "house")
                        Text("Home")
                    }.tag(0)
                SearchView()
                    .tabItem {
                        Image(systemName: "magnifyingglass")
                        Text("Search")
                    }.tag(1)
               DownloadsView()
                    .tabItem {
                        Image(systemName: "arrow.down.to.line.alt")
                        Text("Downloads")
                    }.tag(2)
                ComingSoon()
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
            
            
            PreviewList(movies: exampleMovies,
                        currentSelection: $previewStartingIndex,
                        isVisible: $showPreviewFullScreen)
                .offset(y: previewCurrentPos)
                .isHidden(!showPreviewFullScreen)
                .animation(.easeIn)
                .transition(.move(edge: .bottom))
        }
        .onChange(of: showPreviewFullScreen, perform: { value in
            if value {
                withAnimation {
                    self.previewCurrentPos = .zero
                }
            }else {
                withAnimation {
                    self.previewCurrentPos = screen.height + 20
                }
            }
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
