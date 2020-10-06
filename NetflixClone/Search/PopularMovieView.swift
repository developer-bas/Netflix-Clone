//
//  PopularMovieView.swift
//  NetflixClone
//
//  Created by PROGRAMAR on 06/10/20.
//

import SwiftUI
import KingfisherSwiftUI

struct PopularMovieView: View {
    var movie: Movie
    
    @Binding var movieDetailToShow : Movie?
    
    
    var body: some View {
        GeometryReader { proxy in
            HStack{
                KFImage(movie.thumbnailURL)
                    .resizable()
                    .frame(width: proxy.size.width / 3)
                    .padding(.leading, 3)
                
               
                Text(movie.name)
                Spacer()
                
                
                Button(action: {}, label: {
                    Image(systemName: "arrowtriangle.right.fill")
                })
                .padding(.trailing, 20)
            }
            .foregroundColor(.white)
            .onTapGesture(perform: {
                self.movieDetailToShow = movie
            })
        }
    }
}

struct PopularMovieView_Previews: PreviewProvider {
    static var previews: some View {
        
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            
            PopularMovieView(movie: exampleMovie1, movieDetailToShow: .constant(nil) )
                .frame(height: 75)
                .padding()
        }
    }
}
