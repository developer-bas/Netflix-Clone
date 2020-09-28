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
    
    @State private var topRowSelection : HomeTopRow = .home
    @State private var homeGenre: HomeGenre = .AllGenres
    
    @State private var showGenreSelection = false
    @State private var showTopRowSelection = false
    
    var body: some View {
        ZStack{
            Color.black
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
//            Main Vstack
            ScrollView(showsIndicators: false) {
                
                LazyVStack {
                    
                    TopRowButtons(topRowSelection: $topRowSelection, homeGenre: $homeGenre, showGenreSelection: $showGenreSelection,showTopRowSelection: $showTopRowSelection)
                        .zIndex(0)
                    
                    TopMoviePreview(movie: exampleMovie5)
                        .frame(width: screen.width)
                        .padding(.top,-100)
                        .zIndex(-1)
                    
                    HomeStack(vm: vm,topRowSelection: topRowSelection, selectedGenre: homeGenre, movieDetailToShow: $movieDetailToShow)
                }
            }
            
            if movieDetailToShow != nil {
                
                MovieDetail(movie: movieDetailToShow!, movieDetailToShow: $movieDetailToShow )
                    .animation(.easeIn)
                    .transition(.opacity)
            }
            
            if  showTopRowSelection {
                Group {
                    Color.black.opacity(0.84)
                    
                    VStack(spacing: 35){
                        Spacer()
                        ForEach(HomeTopRow.allCases, id: \.self){ topRow in
                            
                            Button(action: {
                               topRowSelection = topRow
                                showTopRowSelection = false
                            }, label: {
                                if topRow == topRowSelection {
                                    Text("\(topRow.rawValue)")
                                        .bold()
                                }else{
                                    Text("\(topRow.rawValue)")
                                        .foregroundColor(.gray)
                                }
                                
                            })
                            
                        }
                       Spacer()
                        Button(action: {
                            showTopRowSelection = false
                        }, label: {
                            Image(systemName: "xmark.circle.fill")
                                .font(.system(size: 40))
                        })
                        .padding(.bottom, 30)
                        
                    }
                }
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                .font(.title)
                
                
            }
            if  showGenreSelection {
                Group {
                    Color.black.opacity(0.84)
                    
                    VStack(spacing: 35){
                        Spacer()
                        ScrollView{
                        ForEach(vm.allGenre, id: \.self){ genre in
                            
                            Button(action: {
                               homeGenre = genre
                                showGenreSelection = false
                                
                            }, label: {
                                if genre == homeGenre {
                                    Text("\(genre.rawValue)")
                                        .bold()
                                }else{
                                    Text("\(genre.rawValue)")
                                        .foregroundColor(.gray)
                                }
                                
                            })
                            .padding(.bottom, 30)
                            
                        }
                        
                    }
                       Spacer()
                        Button(action: {
                            showGenreSelection = false
                        }, label: {
                            Image(systemName: "xmark.circle.fill")
                                .font(.system(size: 40))
                        })
                        .padding(.bottom, 40)
                        
                    }
                    .padding(.top,0)
                }
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                .font(.title)
                
                
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
    @Binding var topRowSelection: HomeTopRow
    @Binding var homeGenre: HomeGenre
    
    @Binding  var showGenreSelection : Bool
    @Binding var showTopRowSelection :  Bool
    
    var body: some View {
        
        switch topRowSelection {
        case .home:
            HStack {
                Button(action:{
                    topRowSelection = .home
                },label:{
                    Image("netflix_logo")
                        .resizable()
                        .scaledToFit()
                        .frame(width:50)
                }).buttonStyle(PlainButtonStyle())
                
                Spacer()
                Button(action:{
                    topRowSelection = .tvShows
                },label:{
                    Text("TV Shows")
                }).buttonStyle(PlainButtonStyle())
                
                Spacer()
                Button(action:{
                    topRowSelection = .movies
                },label:{
                    Text("Movies")
                }).buttonStyle(PlainButtonStyle())
                
                Spacer()
                Button(action:{
                    topRowSelection = .myList
                },label:{
                    Text("My List")
                }).buttonStyle(PlainButtonStyle())
                
            }
            .padding(.leading,10)
            .padding(.trailing,30)
        case .tvShows , .movies , .myList:
            HStack {
                Button(action:{
                    topRowSelection = .home
                },label:{
                    Image("netflix_logo")
                        .resizable()
                        .scaledToFit()
                        .frame(width:50)
                }).buttonStyle(PlainButtonStyle())
                
               
                HStack(spacing: 20){
                    Button(action:{
                        showTopRowSelection = true
                    },label:{
                        HStack {
                            Text(topRowSelection.rawValue)
                                .font(.system(size: 18))
                            Image(systemName: "triangle.fill")
                                .rotationEffect(.degrees(180), anchor: .center)
                                .font(.system(size: 10))
                        }
                }).buttonStyle(PlainButtonStyle())
                
                
                Button(action:{
                    showGenreSelection = true
                },label:{
                    HStack {
                        Text(homeGenre.rawValue)
                            .font(.system(size: 12))
                        Image(systemName: "triangle.fill")
                            .rotationEffect(.degrees(180), anchor: .center)
                            .font(.system(size: 7))
                    }
                }).buttonStyle(PlainButtonStyle())
                
                Spacer()
                }
                
            }
            .padding(.leading,30)
            .padding(.trailing,30)
            
      
        }
        
        
  
    }
}

enum HomeTopRow: String, CaseIterable{
    case home = "Home"
    case tvShows = "TV Shows"
    case movies = "Movies"
    case myList = "My List"
    
    
}

enum HomeGenre: String  {
    case AllGenres
    case Action
    case Comedy
    case Horror
    case Thriller
    case SciFi
    case Romance
    case LGBTQ
    
    
}


