//
//  HomeThoughtsView.swift
//  one
//
//  Created by tabarek alawcee on 15/10/2023.
//

import SwiftUI

struct HomeThoughtsView: View {
    @State var profileImage: String
    @State var userName: String
    @State var thought: String
    @State var comment: String
    
    var body: some View {

            VStack {
                HStack {
                    Image(profileImage)
                        .resizable()
                        .frame(width: 40, height: 40)
                        .cornerRadius(40)
                        .padding(.leading, 5)
                    Text("@\(userName)")
                    Spacer()
                }
                Text(thought)
                    .frame(width: 350, height: 100)
                    .background(Color("DarkGreen"))
                HStack {
                    TextField("Add a Comment", text: $comment)
                        .padding(10)
                    Spacer()
                    Image(systemName: "paperplane.fill")
                        .resizable()
                        .frame(width: 25, height: 25)
                        .padding(.trailing, 10)
                }
            }
            .padding(10)
            .border(.black, width: 1)
    }
}

struct HomeThoughtsView_Previews: PreviewProvider {
    static var previews: some View {
        HomeThoughtsView(profileImage: "profileimage", userName: "aa_batteries", thought: "i’ve been working on this new shooter game and it’s almost done but i need someone to help me design the characters and maps", comment: "")
    }
}
