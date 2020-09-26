//
//  EpisodesView.swift
//  NetflixClone
//
//  Created by PROGRAMAR on 25/09/20.
//

import SwiftUI

struct EpisodesView: View {
    
    var episodes : [Episode]
    
    @Binding var showSeasonPicker: Bool
    @Binding var selectedSeason : Int
    
    func getEpisodes(forSeason  season:  Int)  -> [Episode]{
        return episodes.filter({$0.season == season})
    }
    
    
    var body: some View {
        VStack(spacing: 14){
//            Season picker
            HStack{
                Button(action:{
                    showSeasonPicker = true
                    print("Estoy tocando el boton \($selectedSeason) \($showSeasonPicker)")
                },label:{
                    
                    Group{
                        Text("Season \(selectedSeason)")
                        Image(systemName: "chevron.down")
                    }
                    .font(.system(size: 16))
                })
                Spacer()
            }
            
            ForEach(getEpisodes(forSeason: selectedSeason)){ episode in
                VStack(alignment: .leading){
                    HStack{
                        VideoPreviewImage(imageURL:episode.thumbnailURL ,videoURL: episode.videoURL)
                            .frame(width: 120, height: 70)
                            .clipped()
                        VStack(alignment: .leading){
                            Text("\(episode.episodeNumber).  \(episode.name)")
                            Text("\(episode.length) m")
                                .font(.system(size: 12))
                                .foregroundColor(.gray)
                        }
                        Spacer()
                        Image(systemName: "arrow.down.to.line.alt")
                            .font(.system(size: 20))
                    }
                    
                    
                    
                    Text(episode.description)
                        .font(.system(size:13))
                        .lineLimit(3)
                    
                }
                .padding(.bottom,20)

            }
            
            Spacer()
        }
        .foregroundColor(.white)
        .padding(.horizontal,20)
    }
}

struct EpisodesView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            EpisodesView(episodes: allExampleEpisodes, showSeasonPicker: .constant(false), selectedSeason: .constant(1))
        }
    }
}
