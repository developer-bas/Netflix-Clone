//
//  SearchResultsGrid.swift
//  NetflixClone
//
//  Created by PROGRAMAR on 06/10/20.
//

import SwiftUI

struct SearchResultsGrid: View {
    
    var movies: [Movie]
    @Binding var movieDetailToShow: Movie?
    
    
    let columns: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    
    var body: some View {
        LazyVGrid(columns: columns, spacing: 10){
            ForEach(movies, id: \.id){ movie in
                StandardHomeMovie(movie: movie)
                    .frame(height: 150)
                    .onTapGesture(perform: {
                        movieDetailToShow = movie
                })
            }
        }
    }
}

struct SearchResultsGrid_Previews: PreviewProvider {
    static var previews: some View {
        SearchResultsGrid(movies: generateMovies(21), movieDetailToShow: .constant(nil))
    }
}
