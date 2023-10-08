//
//  SignInView.swift
//  one
//
//  Created by sal on 09/09/2023.
//

import SwiftUI

struct SignInView: View {
    
    @State private var username = ""
    @State private var password = ""
    @State private var isSignedIn = false

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
                   
                    isSignedIn = true
                }) {
                    Text("Sign In")
                    
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
            .navigationBarTitle("Sign in")
        }
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}
