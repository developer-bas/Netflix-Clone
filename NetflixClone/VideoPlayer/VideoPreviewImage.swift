//
//  VideoPreviewImage.swift
//  NetflixClone
//
//  Created by PROGRAMAR on 25/09/20.
//

import SwiftUI
import KingfisherSwiftUI

struct VideoPreviewImage: View {
   var imageURL : URL
    var  videoURL : URL
    
    @State private var showVideoPlayer = false
    
    var body: some View {
        ZStack{
            KFImage(imageURL)
                .resizable()
                .aspectRatio(contentMode: .fill)
            
            Button(action:{
                showVideoPlayer = true
            },label:{
                Image(systemName: "play.circle")
                    .foregroundColor(.white)
                    .font(.system(size: 40))
            }).sheet(isPresented: $showVideoPlayer, content: {
                SwiftUIVideoView(url: videoURL)
            })
                
        }
    }
}

struct VideoPreviewImage_Previews: PreviewProvider {
    static var previews: some View {
        VideoPreviewImage(imageURL: exampleImageURL, videoURL: exampleVideoURL)
    }
}
