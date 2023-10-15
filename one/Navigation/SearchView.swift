//
//  SearchView.swift
//  one
//
//  Created by tabarek alawcee on 14/10/2023.
//

import SwiftUI

struct SearchView: View {
    @State var searchText: String = ""
    var body: some View {
        NavigationView {
          
                    VStack {

                        HStack {
                            
                            Spacer()
                            Text("Search")
                            Spacer()
                        }
 

                        HStack {
                            NavigationLink {
                                ProfileView(username: "o4ucf", profileImage: "profileimage", name: "fatima", bio: "designing and brainstorming", highlightImage: "highlightimage", posts: 7, interests: 14)
                            } label: {
                                Image(systemName: "chevron.left")
                                    .foregroundColor(.black)
                                    .offset(x: 20)
                            }
                            
                            Text("Search")
                                .font(.system(size: 30))
                                .frame(maxWidth: .infinity)
                                .padding()
                                .foregroundColor(.black)
                                .padding(.trailing, 40)
                        }
                        .background(Color("DarkGreen"))
                        
                        HStack {
                            searchBar
                        }
                        .padding(.horizontal, 5)
                        
                        
                        
                        Spacer()
                        
                        
                        ScrollView {
                
                            MessagesHistoryView(profileImage: "profileimage", userName: "hoor_azab")
                            MessagesHistoryView(profileImage: "profileimage", userName: "aouw_vhs")
                            MessagesHistoryView(profileImage: "profileimage", userName: "saham_almsri")
                            MessagesHistoryView(profileImage: "profileimage", userName: "aa_batteries")
                            MessagesHistoryView(profileImage: "profileimage", userName: "23hey_6")
                            MessagesHistoryView(profileImage: "profileimage", userName: "hoor_azab")
                            MessagesHistoryView(profileImage: "profileimage", userName: "hoor_azab")
                            MessagesHistoryView(profileImage: "profileimage", userName: "hoor_azab")
                            MessagesHistoryView(profileImage: "profileimage", userName: "hoor_azab")
                            MessagesHistoryView(profileImage: "profileimage", userName: "hoor_azab")
                            
                            
                        }
                        
                        
                        Spacer()
                        

                        
                    }
                   
    
                        
                    
                }
       
                .navigationBarHidden(true)
                
            }
    var searchBar: some View {
        HStack {
            TextField("Search..", text:$searchText)
                .padding(.horizontal, 10)
        }
        .frame(height: 40)
        .background(Color("DarkGreen"))
        .cornerRadius(20)
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
