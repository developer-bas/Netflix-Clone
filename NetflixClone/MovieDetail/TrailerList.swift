//
//  TrailerList.swift
//  NetflixClone
//
//  Created by PROGRAMAR on 25/09/20.
//

import SwiftUI

struct TrailerList: View {
    var trailers : [Trailer]
    
    let screen = UIScreen.main.bounds
    
    var body: some View {
        VStack{
            ForEach(trailers){ trailer in
                
                VStack(alignment: .leading){
                    VideoPreviewImage(imageURL: trailer.thumbnailImageURL, videoURL: trailer.videoURL)
                        .frame(maxWidth: screen.width)
                    
                    
                    Text(trailer.name)
                        .font(.headline)
                    
                }
                .foregroundColor(.white)
                .padding(.bottom, 10)
                
            }
        }
    }
}

struct TrailerList_Previews: PreviewProvider {
    static var previews: some View {
        
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            TrailerList(trailers: exampleTrailers)
        }
    }
}
