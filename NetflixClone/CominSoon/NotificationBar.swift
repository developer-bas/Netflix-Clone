//
//  NotificationBar.swift
//  NetflixClone
//
//  Created by PROGRAMAR on 11/10/20.
//

import SwiftUI

struct NotificationBar: View {
    
    @Binding var showNotificationList : Bool
    
    var body: some View {
        Button(action: {
            
        }, label: {
            HStack {
                Image(systemName: "bell")
                Text("Notifications")
                    .bold()
                Spacer()
                Image(systemName: "chevron.right")
            }
            .font(.system(size: 18,weight: .bold))
        })
        .foregroundColor(.white)
        .padding()
    }
}

struct NotificationBar_Previews: PreviewProvider {
    static var previews: some View {
        ZStack{
            Color.black
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            NotificationBar(showNotificationList: .constant(false))
        }
    }
}
