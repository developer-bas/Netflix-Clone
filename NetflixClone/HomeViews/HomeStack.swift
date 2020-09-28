//
//  HomeStack.swift
//  NetflixClone
//
//  Created by PROGRAMAR on 27/09/20.
//

import Foundation
import SwiftUI

struct HomeStack: View {
    var vm: HomeVM
    var topRowSelection: HomeTopRow
    var selectedGenre :HomeGenre
    
    @Binding var movieDetailToShow : Movie?
    
    var body: some View {
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
                        ForEach(vm.getMovie(forCat: category, andHomeRow: topRowSelection, andGenre: selectedGenre)){ movie in
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
struct HomeStack_Previews: PreviewProvider {
    static var previews: some View {
        HomeStack(vm: HomeVM(), topRowSelection: .home, selectedGenre: .AllGenres, movieDetailToShow: .constant(nil))
    }
}
