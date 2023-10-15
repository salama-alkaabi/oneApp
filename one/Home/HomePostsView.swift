//
//  HomePostsView.swift
//  one
//
//  Created by tabarek alawcee on 14/10/2023.
//

import SwiftUI

struct HomePostsView: View {
    
    @State var profileImage: String
    @State var userName: String
    @State var postImage: String
    
    var body: some View {

            VStack {
                HStack {
                    Image(systemName: profileImage)
                    Text(userName)
                    Spacer()
                }
                Image(postImage)
                    .resizable()
                    .scaledToFit()
                HStack {
                    Image(systemName: "star.circle")
                    Image(systemName: "paperplane.fill")
                    Spacer()
                }
            }
            .padding(10)
            .border(.black, width: 1)
    }
}

struct HomePostsView_Previews: PreviewProvider {
    static var previews: some View {
        HomePostsView(profileImage: "person.crop.circle", userName: "hoor_azab", postImage: "postimage")
    }
}
