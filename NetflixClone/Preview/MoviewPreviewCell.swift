//
//  MoviewPreviewCell.swift
//  NetflixClone
//
//  Created by PROGRAMAR on 03/12/20.
//

import SwiftUI
import KingfisherSwiftUI

struct MoviewPreviewCell: View {
    var movie: Movie
    
    let color : [Color] = [.yellow,.red,.blue, .green, .orange]
    var body: some View {
        ZStack(alignment: .bottom) {
            KFImage(movie.thumbnailURL)
                .resizable()
                .scaledToFill()
                .clipShape(Circle())
                .overlay(
                    Circle()
                        .stroke(lineWidth: 5.0)
                        .foregroundColor(color.randomElement())
            )
            Image(movie.previewImageName)
                .resizable()
                .scaledToFit()
                .offset(y: -30)
                .frame(height: 65)
        }
//        .frame(height: 100)
    }
}

struct MoviewPreviewCell_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            
            MoviewPreviewCell(movie: exampleMovie6)
                .frame(width: 150,height: 50)
        }
    }
}
