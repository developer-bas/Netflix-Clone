//
//  ComingSoonVM.swift
//  NetflixClone
//
//  Created by PROGRAMAR on 12/10/20.
//

import Foundation

class ComingSoonVM: ObservableObject {
    @Published var movies : [Movie] = []

    
    init(){
        self.movies = generateMovies(20)
    }
    
}
