//
//  ProfilePageView.swift
//  one
//
//  Created by sal on 07/10/2023.
//

import SwiftUI

struct ProfilePageView: View {
    @State var selectedTab: String = "square.grid.3x3"
    @Namespace var animation
    @Environment(\.colorScheme) var scheme
    @State var topHeaderOffset: CGFloat = 0
    
    var body: some View {
        VStack {
            HStack(spacing: 15){
                Button(action: {}, label: {
                    Text("a4ucf")
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(.primary)
                })
                
                    Spacer(minLength: 0)
                
                Button(action: {}, label: {
                    Image(systemName: "plus.app")
                        .font(.title)
                        .foregroundColor(.primary)
                })
                Button(action: {}, label: {
                    Image(systemName: "line.horizontal.3")
                        .font(.title)
                        .foregroundColor(.primary)
                })
            }
            .padding([.horizontal,.top])
            ScrollView(.vertical, showsIndicators: false, content: {
                LazyVStack(pinnedViews: [.sectionHeaders]) {
                    Divider()
                    
                    HStack {
                        Button(action: {}, label: {
                            Image("logo")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 70, height: 70)
                                .overlay(
                                Image(systemName: "plus")
                                    .foregroundColor(.white)
                                    .padding(6)
                                    .background(Color.blue)
                                    .clipShape(Circle())
                                    .padding(2)
                                    .background(Color.white)
                                    .clipShape(Circle())
                                    .offset(x: 5, y: 5)
                                
                                ,alignment: .bottomTrailing
                                )
                        })
                        VStack {
                            Text("675")
                                .font(.title2)
                                .fontWeight(.bold)
                                .foregroundColor(.primary)
                            Text("posts")
                                .foregroundColor(.gray)
                        }
                        .frame(maxWidth: .infinity)
                        
                        VStack{
                            Text("9,206")
                                .font(.title2)
                                .fontWeight(.bold)
                                .foregroundColor(.primary)
                        }
                        .frame(maxWidth: .infinity)
                        
                        VStack{
                            Text("119")
                                .font(.title2)
                                .fontWeight(.bold)
                                .foregroundColor(.primary)
                            Text("following")
                                .foregroundColor(.gray)
                        }
                        .frame(maxWidth: .infinity)
                        VStack(alignment: .leading, spacing: 4, content: {
                            Text(" med student ")
                                .fontWeight(.bold)
                                .foregroundColor(.primary)
                            
                            Text(" HUE ")
                                .fontWeight(.semibold)
                                .foregroundColor(.gray)
                        })
                        .padding(.horizontal)
                        HStack(spacing: 10) {
                            Button(action: {}, label: {
                                Text("edit profile")
                                    .fontWeight(.semibold)
                                    .foregroundColor(.primary)
                                    .padding(.vertical,10)
                                    .frame(maxWidth: .infinity)
                                    .background(
                                    RoundedRectangle(cornerRadius: 4)
                                        .stroke(Color.gray)
                                    )
                            })
                            Button(action: {}, label: {
                                Text("AD tools")
                                    .fontWeight(.semibold)
                                    .foregroundColor(.primary)
                                    .padding(.vertical,10)
                                    .frame(maxWidth: .infinity)
                                    .background(
                                        RoundedRectangle(cornerRadius: 4)
                                            .stroke(Color.gray)
                                    )
                            })
                            
                        }
                        .padding([.horizontal,.top])
                        
                        ScrollView(.horizontal, showsIndicators: false, content: {
                            HStack(spacing: 15) {
                                Button(action: {}, label: {
                                    VStack {
                                        Image(systemName: "plus")
                                            .font(.title2)
                                            .foregroundColor(.primary)
                                            .padding(18)
                                            .background(Circle().stroke(Color.gray))
                                        
                                        Text("new")
                                            .foregroundColor(.primary)
                                    }
                                })
                            }
                            .padding([.horizontal,.top])
                        })
                    }
                }
            })
        }
    }
}

struct ProfilePageView_Previews: PreviewProvider {
    static var previews: some View {
        ProfilePageView()
    }
}
