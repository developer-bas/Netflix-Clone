//
//  ComingSoon.swift
//  NetflixClone
//
//  Created by PROGRAMAR on 11/10/20.
//

import SwiftUI

struct ComingSoon: View {
    
    @State private var showNotificationList = false
    @State private var navHidden = true
    
    var body: some View {
        NavigationView {
            Group {
                ZStack{
                    Color.black
                        .edgesIgnoringSafeArea(.all)
                    ScrollView{
                        VStack{
                            NotificationBar(showNotificationList:  $showNotificationList)
                            Text("For Each Loop")
                        }
                    }
                }
                
                
                NavigationLink(
                    destination: Text("Destination"),
                    isActive: $showNotificationList,
                    label: {
                       EmptyView()
                    })
                    .navigationTitle("")
                    .navigationBarHidden(navHidden)
//                    .onReceive(NotificationCenter, perform: { _ in
//                        /*@START_MENU_TOKEN@*//*@PLACEHOLDER=code@*/ /*@END_MENU_TOKEN@*/
//                    })
                
            }
        }
    }
}

struct ComingSoon_Previews: PreviewProvider {
    static var previews: some View {
        ComingSoon()
    }
}
