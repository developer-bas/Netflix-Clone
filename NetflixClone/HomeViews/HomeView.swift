//
//  HomeView.swift
//  NetflixClone
//
//  Created by PROGRAMAR on 21/09/20.
//

import SwiftUI

struct HomeView: View {
    var vm = HomeVM()
    let screen = UIScreen.main.bounds
    
    @State private var movieDetailToShow: Movie? = nil
    
    var body: some View {
        ZStack{
            Color.black
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
//            Main Vstack
            ScrollView(showsIndicators: false) {
                
                LazyVStack {
                    
                    TopRowButtons()
                        .zIndex(0)
                    
                    TopMoviePreview(movie: exampleMovie5)
                        .frame(width: screen.width)
                        .padding(.top,-100)
                        .zIndex(-1)
                    
                    ForEach(vm.allCategories, id: \.self){ category in
                        
                        VStack {
                            HStack {
                                Text(category)
                                    .font(.title3)
                                    .bold()
                                Spacer()
                            }
                            ScrollView(.horizontal, showsIndicators: false) {
                                LazyHStack{
                                    ForEach(vm.getMovie(forCat: category)){ movie in
                                        StandardHomeMovie(movie: movie)
                                            .frame(width: 100,height: 200)
                                            .padding(.horizontal,20)
                                            .onTapGesture( perform: {
                                                movieDetailToShow = movie
                                            })
                                    }
                                }
                            }
                        }
                    }
                }
            }
            
            if movieDetailToShow != nil {
                
                MovieDetail(movie: movieDetailToShow!, movieDetailToShow: $movieDetailToShow )
                    .animation(.easeIn)
                    .transition(.opacity)
            }
        }.foregroundColor(.white)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

struct TopRowButtons: View {
    var body: some View {
        HStack {
            Button(action:{
                
            },label:{
                Image("netflix_logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width:50)
            }).buttonStyle(PlainButtonStyle())
            
            Spacer()
            Button(action:{
                
            },label:{
                Text("TV Shows")
            }).buttonStyle(PlainButtonStyle())
            
            Spacer()
            Button(action:{
                
            },label:{
                Text("Movies")
            }).buttonStyle(PlainButtonStyle())
            
            Spacer()
            Button(action:{
                
            },label:{
                Text("My List")
            }).buttonStyle(PlainButtonStyle())
            
        }
        .padding(.leading,10)
        .padding(.trailing,30)
    }
}
