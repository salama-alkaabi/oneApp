//
//  LoginView.swift
//  one
//
//  Created by sal on 09/09/2023.
//

import SwiftUI

struct LoginView: View {
    
    @State private var username = ""
    @State private var password = ""
    @State private var isLoggedIn = false
    
    var body: some View {
        NavigationView {
            VStack {
                
                TextField("Username", text: $username)
                    .frame(height: 40)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .overlay( 
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(.black, lineWidth: 1)
                    )
                    .padding(.horizontal, 15)
                    .padding(.top, 10)
                    

                SecureField("Password", text: $password)
                    .frame(height: 40)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(.black, lineWidth: 1)
                    )
                    .padding(.horizontal, 15)
                    .padding(.top, 10)

                Button(action: {
                   
                    isLoggedIn = true
                }) {
                    Text("Login")
                    
                        .frame(maxWidth: .infinity)
                        .padding()
                        .foregroundColor(.black)
                        .background(.mint)
                        .cornerRadius(10)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(.black, lineWidth: 2)
                        )
                        
                        
                }
                .padding()



                Spacer()
            }
            .navigationBarTitle("Login")
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
