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
    public var allGenre : [HomeGenre] = [.AllGenres,.Action,.Comedy,.Horror,.Thriller,.LGBTQ,.SciFi,.Romance]
    
    public func getMovie(forCat cat:String, andHomeRow homeRow: HomeTopRow , andGenre genre : HomeGenre) -> [Movie]{
       
        
        switch homeRow {
        case .home:
            return movies[cat] ?? []
        case .movies :
            return (movies[cat] ?? []).filter({($0.movieType == .movie) && ($0.genre == genre)})
        case .tvShows :
            return (movies[cat] ?? []).filter({($0.movieType == .tvShow) && ($0.genre == genre)})
        case .myList :
            return movies[cat] ?? []
        }
        
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
