//
//  MoviewPreviewRow.swift
//  NetflixClone
//
//  Created by PROGRAMAR on 03/12/20.
//

import SwiftUI

struct MoviewPreviewRow: View {
    var movies: [Movie]
    
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
                            .frame(width: 120, height: 220)
                            .padding(.trailing, 14)
                            .padding(.leading, 14)
                    }
                }
            })
        }
        .frame(height: 230)
    }
}

struct MoviewPreviewRow_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            
            Color.black
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            
            
            MoviewPreviewRow(movies: [exampleMovie1,exampleMovie2,exampleMovie3, exampleMovie4])
        }
        
    }
}
