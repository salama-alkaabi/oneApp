//
//  MessagesHistoryView.swift
//  one
//
//  Created by tabarek alawcee on 15/10/2023.
//

import SwiftUI

struct MessagesHistoryView: View {
    
    @State var profileImage: String
    @State var userName: String
    
    var body: some View {
        HStack{
            Image(profileImage)
                .resizable()
                .frame(width: 40, height: 40)
                .cornerRadius(40)
            Text("@\(userName)")
            Spacer()
        }
        .padding(10)
        .border(.black, width: 2)
    }
}

struct MessagesHistoryView_Previews: PreviewProvider {
    static var previews: some View {
        MessagesHistoryView(profileImage: "profileimage", userName: "hoor_azab")
    }
}
