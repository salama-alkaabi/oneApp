//
//  ProfileView.swift
//  one
//
//  Created by tabarek alawcee on 15/10/2023.
//

import SwiftUI

struct ProfileView: View {
    
    @State var username: String
    @State var profileImage: String
    @State var name: String
    @State var bio: String
    @State var highlightImage: String
    @State var posts: Int
    @State var interests: Int
    
    @State var postsActive: Bool = true
    
    var postsView: some View {
        VStack {
            HomePostsView(profileImage: profileImage, userName: username, postImage: "postimage")
            HomePostsView(profileImage: profileImage, userName: username, postImage: "postimage")
            HomePostsView(profileImage: profileImage, userName: username, postImage: "postimage")
            HomePostsView(profileImage: profileImage, userName: username, postImage: "postimage")
        }
    }

    
    var thoughtsView: some View {
        VStack {
            HomeThoughtsView(profileImage: "profileimage", userName: "aa_batteries", thought: "i’ve been working on this new shooter game and it’s almost done but i need someone to help me design the characters and maps", comment: "")
            HomeThoughtsView(profileImage: "profileimage", userName: "aa_batteries", thought: "i’ve been working on this new shooter game and it’s almost done but i need someone to help me design the characters and maps", comment: "")
            HomeThoughtsView(profileImage: "profileimage", userName: "aa_batteries", thought: "i’ve been working on this new shooter game and it’s almost done but i need someone to help me design the characters and maps", comment: "")
            HomeThoughtsView(profileImage: "profileimage", userName: "aa_batteries", thought: "i’ve been working on this new shooter game and it’s almost done but i need someone to help me design the characters and maps", comment: "")
        }
    }
    
    var body: some View {
        NavigationView {
                    VStack {

                        HStack {
                            Spacer()
                            Text("Profile")
                            Spacer()
                        }
 

                        HStack {
                            Text(username)
                                .font(.system(size: 30))
                                .padding()
                                .foregroundColor(.black)
                                .padding(.trailing, 40)
                            
                            Spacer()
                            
                            NavigationLink {
                                EditProfileView()
                            } label: {
                                Text("✐")
                                    .foregroundColor(.black)
                                    .frame(width: 30)
                                    .font(.system(size: 30))
                                    .padding(.horizontal, 10)
                                    .padding(.vertical, 5)
                                    .background(.white)
                                    .border(.black, width: 2)
                                    .padding(.trailing, 10)
                            }
                            
                            NavigationLink {
                                AddPostView()
                            }
                            label: {
                                Text("+")
                                    .frame(width: 30)
                                    .font(.system(size: 30))
                                    .padding(.horizontal, 10)
                                    .padding(.vertical, 5)
                                    .background(.white)
                                    .border(.black, width: 2)
                                .padding(.trailing, 10)
                            }
                                
                        }
                        .background(Color("DarkGreen"))
                        
                        VStack {
                
                            HStack {
                                Image(profileImage)
                                    .resizable()
                                    .frame(width: 100, height: 100)
                                    .cornerRadius(50)
                                    .padding(.leading, 10)
                                Spacer()
                                
                                Text("\(interests)")
                                    .font(.system(size: 25))
                                    .padding(.trailing, 80)
                                Text("\(posts)")
                                    .font(.system(size: 25))
                                    .padding(.leading, 20)
                                Spacer()
                            }
                            
                            HStack {
                                Text("")
                                .frame(width: 100, height: 100)
                                Spacer()
                                
                                Text("Common\nInterests")
                                    .font(.system(size: 25))
                                    .padding(.horizontal, 20)
                                Text("Posts")
                                    .font(.system(size: 25))
                                    .padding(.horizontal, 20)
                                Spacer()
                            }
                            .padding(.top, -70)
                            
                            HStack{
                                VStack(alignment: .leading) {
                                    Text(name)
                                    Text(bio)
                                }
                                .padding(.leading, 10)
                                Spacer()
                            }
                            
                            ScrollView(.horizontal) {
                                HStack {
                                    Image(highlightImage)
                                        .resizable()
                                        .frame(width: 75, height: 75)
                                        .cornerRadius(50)
                                        .padding(.leading, 10)
                                    Image(highlightImage)
                                        .resizable()
                                        .frame(width: 75, height: 75)
                                        .cornerRadius(50)
                                        .padding(.leading, 10)
                                    Image(highlightImage)
                                        .resizable()
                                        .frame(width: 75, height: 75)
                                        .cornerRadius(50)
                                        .padding(.leading, 10)
                                    Image(highlightImage)
                                        .resizable()
                                        .frame(width: 75, height: 75)
                                        .cornerRadius(50)
                                        .padding(.leading, 10)
                                    Image(highlightImage)
                                        .resizable()
                                        .frame(width: 75, height: 75)
                                        .cornerRadius(50)
                                        .padding(.leading, 10)
                                }
                            }
                            
                            VStack{
                                HStack {
                                    Button {
                                        postsActive = false
                                    } label: {
                                        Text("Thoughts")
                                            .foregroundColor(.white)
                                            .frame(width: 170)
                                            .padding(10)
                                            .background(postsActive ? Color("LightGreen") : Color("DarkGreen") )
                                            .cornerRadius(10)
                                            .offset(x: 5)
                                    }
                                    
                                    Button {
                                        postsActive = true
                                    } label: {
                                        Text("Posts")
                                            .foregroundColor(.white)
                                            .frame(width: 170)
                                            .padding(10)
                                            .background(postsActive ? Color("DarkGreen") : Color("LightGreen") )
                                            .cornerRadius(10)
                                            .offset(x: -5)
                                    }
                                }
                                ScrollView {
                                    if postsActive {
                                        postsView
                                    } else {
                                        thoughtsView
                                    }
                                    
                                    
                                }
                                Spacer()
                            }
                            
                            
                            
                        }
                        
                        
                        Spacer()
                        

                        
                    }
                   
    
                        
                    
                }
       
                .navigationBarHidden(true)
                
            }
    
    
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(username: "o4ucf", profileImage: "profileimage", name: "fatima", bio: "designing and brainstorming", highlightImage: "highlightimage", posts: 7, interests: 14)
    }
}
