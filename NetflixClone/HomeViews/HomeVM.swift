//
//  HomeVM.swift
//  NetflixClone
//
//  Created by PROGRAMAR on 21/09/20.
//

import Foundation

class HomeVM: ObservableObject{
    
    
//    String == Category
    @Published var movies : [String:[Movie]] = [:]
    
    public var allCategories : [String] {
        return movies.keys.map({ String($0)})
    }
    
    
    public func getMovie(forCat cat:String ) -> [Movie]{
        return movies[cat] ?? []
        
    }
    
    init(){
        setupMovies()
    }
    
    func setupMovies(){
        movies["Trending Now"] = exampleMovies
        movies["Stand-Up Comedy"] = exampleMovies.shuffled()
        movies["Watch Again"] = exampleMovies.shuffled()
    }
}
