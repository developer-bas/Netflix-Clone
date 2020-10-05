//
//  SearchVM.swift
//  NetflixClone
//
//  Created by PROGRAMAR on 04/10/20.
//

import Foundation
import SwiftUI

class SearchVM: ObservableObject {
    
    @Published var isLoading :  Bool = false
    @Published var viewState: ViewState = ViewState.ready
    
    @Published var popularMovies : [Movie] = []
    @Published var searchResults: [Movie] = []
    @Published var isShowwingPopularMovies = true
    
    public func updateSearchText(with text: String ){
        setViewState(to: .loading)
        
        
        if text.count > 0 {
            isShowwingPopularMovies = false
            getSearchResults(forText: text)
        }
        else{
            isShowwingPopularMovies = true
        }
    }
    
    init() {
        getPopularMovies()
    }
 
    
    private func getPopularMovies(){
        
        self.popularMovies = [] //generateMOVIES(21)
    }
    
    private func getSearchResults(forText text:String){
        let haveResult = Int.random(in: 0...3)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2, execute: {
            if haveResult == 0 {
                self.searchResults = []
                self.setViewState(to: .empty)
            }else{
//                let movies = generateMovies(21)
                self.searchResults = []
                self.setViewState(to: .ready)
            }
        })
    }
    
    
    private func setViewState(to state: ViewState){
        DispatchQueue.main.async {
            self.viewState = state
            
            self.isLoading = state == .loading
        }
    }
    
}

enum ViewState{
    case empty
    case loading
    case ready
    case error
}
