//
//  SearchView.swift
//  NetflixClone
//
//  Created by PROGRAMAR on 04/10/20.
//

import SwiftUI

struct SearchView: View {
    
    @ObservedObject  var vm = SearchVM()
    @State private var searchText = " "
    
    var body: some View {
        ZStack{
            Color.black
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            VStack{
                SearchBar(text: $searchText, isLoading: $vm.isLoading)
                    .padding()
                Spacer()
            }
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
