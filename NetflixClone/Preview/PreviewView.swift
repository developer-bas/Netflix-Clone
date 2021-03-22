//
//  PreviewView.swift
//  NetflixClone
//
//  Created by PROGRAMAR on 21/03/21.
//

import SwiftUI

struct PreviewView: View {
    
    @ObservedObject var vm: PreviewVM
    
    var playVideo : Bool
    
    var body: some View {
        ZStack{
            Color.black.edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            
            TrailerPlayerView(videoURL: vm.movie.trailers.first?.videoURL,
                              playVideo:.constant(playVideo))
            VStack{
                HStack{
                    VStack(alignment: .leading, spacing: 0, content: {
                        Text(vm.movie.name)
                            .foregroundColor(vm.movie.accentColor)
                            .bold()
                            .font(.largeTitle)
                    })
                        
                    Spacer()
                    
                   
                }
                .padding(.leading,20)
                .padding(.top, 60)
                Spacer()
                
                HStack{
                    ForEach(0..<vm.movie.categories.count){ catIndex in
                        let category = vm.movie.categories[catIndex]
                        
                        HStack{
                            Text(category).font(.footnote)
                            if catIndex != vm.movie.categories.count - 1 {
                                
                                Image(systemName: "circle.fill")
                                    .font(.system(size: 3))
                                
                            }
                            
                        }
                    }
                }
                HStack{
                    Spacer()
                    SmallVerticalButton(text: "My List", isOnImage: "checkmark", isOffImage: "plus", color: vm.movie.accentColor,  isOn: true) {
                        
                    }
                    Spacer()
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                        HStack{
                            Image(systemName: "arrowtriangle.right.fill")
                            Text("Play")
                                .fontWeight(.heavy)
                        }
                        .padding(.vertical,12)
                        .padding(.horizontal,26)
                        .border(vm.movie.accentColor, width: 3)
                        
                    })
                    Spacer()
                    SmallVerticalButton(text: "info", isOnImage: "info.circle",isOffImage: "info.circle", color: vm.movie.accentColor, isOn: true) {
                        //
                    }
                    Spacer()
                }.padding(.vertical,14)
            }
            .padding(.bottom,48)
            .foregroundColor(vm.movie.accentColor)
        }
        .edgesIgnoringSafeArea(.vertical)
    }
}

struct PreviewView_Previews: PreviewProvider {
    static var previews: some View {
        PreviewView(vm: PreviewVM(movie: exampleMovie1), playVideo: true)
    }
}
