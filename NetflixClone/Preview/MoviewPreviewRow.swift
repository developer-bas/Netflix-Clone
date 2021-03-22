//
//  MoviewPreviewRow.swift
//  NetflixClone
//
//  Created by PROGRAMAR on 03/12/20.
//

import SwiftUI

struct MoviewPreviewRow: View {
    var movies: [Movie]
    
    @Binding var showPreviewFullScreen : Bool
    @Binding var previewStartingIndex : Int
    
    var body: some View {
        VStack(alignment: .leading){
            Text("Previews")
                .font(.title3)
                .bold()
                .foregroundColor(.white)
                .padding(.leading, 6)
            
            ScrollView(.horizontal, showsIndicators: false, content: {
                LazyHStack{
                    ForEach(0..<movies.count){ movieIndex in
                        let movie = movies[movieIndex]
                        MoviewPreviewCell(movie: movie)
                            .frame(width: 120, height: 120)
                            .padding(.trailing, 14)
                            .padding(.leading, 6)
                            .onTapGesture( perform: {
                                previewStartingIndex = movieIndex
                                showPreviewFullScreen = true
                            })
                    }
                }
            })
        }
        .frame(height: 210)
    }
}

struct MoviewPreviewRow_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            
            Color.black
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            
            
            MoviewPreviewRow(movies: exampleMovies,showPreviewFullScreen: .constant(false),previewStartingIndex: .constant(0))
        }
        
    }
}
