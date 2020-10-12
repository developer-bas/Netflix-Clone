//
//  ComingSoonRow.swift
//  NetflixClone
//
//  Created by PROGRAMAR on 12/10/20.
//

import SwiftUI
import KingfisherSwiftUI
import AVKit

struct ComingSoonRow: View {
    var movie : Movie
    
    @Binding var movieDetailToShow : Movie?
    
    let screen =  UIScreen.main.bounds
    
    var player: AVPlayer{
        AVPlayer(url: URL(string: "https://www.radiantmediaplayer.com/media/big-buck-bunny-360p.mp4" )!)
    }
    
    var body: some View {
        VStack{
            VideoPlayer(player: player)
                .frame(height: 200)
            
            VStack{
                HStack{
                    KFImage(movie.thumbnailURL)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: screen.size.width / 3 , height: 75)
                        .clipped()
                    Spacer()
                    
                    Button (action: {
                        
                    }, label: {
                        VStack(spacing: 6){
                            Image(systemName: "bell")
                                .font(.title3)
                            Text("Remind me")
                        }
                    })
                    .padding(.horizontal)
                    
                    
                    Button(action: {
                        movieDetailToShow = movie
                    }, label: {
                        VStack{
                            Image(systemName: "info.circle")
                                .font(.title3)
                            Text("Info")
                        }
                    })
                    .padding(.trailing)
                    
                }
                .font(.caption)
                
                
                VStack(alignment: .leading){
                    Text(movie.name)
                        .font(.title2)
                        .bold()
                    Text(movie.episodeDescriptionDisplay)
                        .foregroundColor(.gray)
                        .font(.subheadline)
                }
                
            }
            .foregroundColor(.white)
            .padding(.horizontal)
        }
    }
}

struct ComingSoonRow_Previews: PreviewProvider {
    static var previews: some View {
        
        
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)
            ComingSoonRow(movie: exampleMovie1, movieDetailToShow: .constant(nil))
        }
    }
}
