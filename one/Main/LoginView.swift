//
//  LoginView.swift
//  one
//
//  Created by sal on 09/09/2023.
//

import SwiftUI
import Firebase

struct LoginView: View {
    
    @State private var email = ""
    @State private var password = ""
    @State private var isLoggedIn = false
    
    var body: some View {
        if isLoggedIn {
            Home_Page()
        } else {
            content
        }
    }
    
    var content: some View {
        NavigationView {
            VStack {
                
                TextField("Email", text: $email)
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
                    loginUser(email: email, password: password) { error in
                        if let error = error {
                            print("Error logging in: \(error.localizedDescription)")
                        } else {
                            print("User successfully logged in")
                            isLoggedIn = true
                        }
                    }

                }) {
                    Text("Login")
                    
                        .frame(maxWidth: .infinity)
                        .padding()
                        .foregroundColor(.black)
                        .background(Color("DarkGreen"))
                        .cornerRadius(10)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(.black, lineWidth: 2)
                        )
                        
                        
                }
                .padding()
                HStack {
                    Text("Don't have an account?")
                    NavigationLink(destination: {
                        RegisterView()
                    }, label: {
                        Text("Register")
                            .foregroundColor(Color("DarkGreen"))
                    })
                    
                }
                


                Spacer()
            }
            .navigationBarTitle("Login")
        }
        .navigationBarHidden(true)
    }
    
    func loginUser(email: String, password: String, completion: @escaping (Error?) -> Void) {
        Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
            if let error = error {
                // Handle login error
                completion(error)
            } else {
                // User successfully logged in
                completion(nil)
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
