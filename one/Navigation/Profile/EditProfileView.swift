//
//  Edit Profile page.swift
//  one
//
//  Created by tabarek alawcee on 14/10/2023.
//

import SwiftUI

struct EditProfileView: View {
    var body: some View {
        NavigationView {
          
                    VStack {

                        HStack {
                            NavigationLink {
                                ProfileView(username: "o4ucf", profileImage: "profileimage", name: "fatima", bio: "designing and brainstorming", highlightImage: "highlightimage", posts: 7, interests: 14)
                            } label: {
                                Image(systemName: "chevron.left")
                                    .foregroundColor(.black)
                                    .offset(x: 20)
                            }
                            Spacer()
                            Text("Profile")
                            Spacer()
                        }
 

                        HStack {
                            Text("✐")
                                .font(.system(size: 40))
                                .padding(.horizontal, 10)
                                .background(.white)
                                .border(.black, width: 2)
                                .padding(.leading, 10)
                            
                            Text("Edit Profile")
                                .font(.system(size: 30))
                                .frame(maxWidth: .infinity)
                                .padding()
                                .foregroundColor(.black)
                                .padding(.trailing, 40)
                        }
                        .background(Color("DarkGreen"))
                        
                        Spacer()
                        
                        
                        VStack {
                
                            Text("username")
                                .font(.system(size: 20))
                                .frame(maxWidth: .infinity)
                                .padding()
                                .foregroundColor(.black)
                            
                            Text("Bio")
                                .font(.system(size: 20))
                                .frame(maxWidth: .infinity)
                                .padding()
                                .foregroundColor(.black)
                            
                            Text("Name")
                                .font(.system(size: 20))
                                .frame(maxWidth: .infinity)
                                .padding()
                                .foregroundColor(.black)
                            
                            Text("Country")
                                .font(.system(size: 20))
                                .frame(maxWidth: .infinity)
                                .padding()
                                .foregroundColor(.black)
                            
                        }
                        .background(Color("DarkGreen"))
                        
                        Spacer()
                        

                        
                    }
                   
    
                        
                    
                }
       
                .navigationBarHidden(true)
                
            }
        }
        
        struct Edit_Profile_page_Previews: PreviewProvider {
            static var previews: some View {
                EditProfileView()
            }
        }
    
    



