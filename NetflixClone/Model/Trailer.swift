//
//  Trailer.swift
//  NetflixClone
//
//  Created by PROGRAMAR on 25/09/20.
//

import Foundation

struct Trailer: Identifiable, Hashable{
    
    var id : String = UUID().uuidString
    var name : String
    var videoURL : URL
    var thumbnailImageURL : URL
    
    
}
