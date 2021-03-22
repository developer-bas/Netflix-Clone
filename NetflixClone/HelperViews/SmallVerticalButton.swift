//
//  SmallVerticalButton.swift
//  NetflixClone
//
//  Created by PROGRAMAR on 21/09/20.
//

import SwiftUI

struct SmallVerticalButton: View {
    var text:String
    
    var isOnImage : String
    var isOffImage: String
    var color : Color = Color.white
    
    var  isOn: Bool
    
    var imageName : String{
        if isOn{
            return isOnImage
        } else{
            return isOffImage
        }
    }
    
    var action: () -> Void

    var body: some View {
        Button(action: {
            action()
        }, label: {
            VStack{
                Image(systemName: imageName)
                    .foregroundColor(color)
                Text(text)
                    .foregroundColor(color)
                    .font(.system(size: 14))
                    .bold()
            }
        })
    }
}

struct SmallVerticalButton_Previews: PreviewProvider {
    static var previews: some View {
        SmallVerticalButton(text: "My List",
                            isOnImage: "Checkmark",
                            isOffImage: "plus",
                            isOn: true){
            print("tapped")
        }
    }
}
