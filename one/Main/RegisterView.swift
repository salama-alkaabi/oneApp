//
//  Regester.swift
//  one
//
//  Created by tabarek alawcee on 12/10/2023.
//

import SwiftUI
import Firebase

struct RegisterView: View {
    
    @State private var email: String = ""
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var confirmPassword: String = ""
    @State private var IsRegisteredIn  = false
    
    var body: some View {
        
        if IsRegisteredIn {
            Home_Page()
        } else {
            content
        }
        
    }

    var content: some View {
        
        NavigationView {
            VStack {
                
                Text("Create New Account")
                    .font(.system(size: 25))
                
                TextField("Email", text: $email)
                    .frame(height: 40)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(.black, lineWidth: 1)
                    )
                    .padding(.horizontal, 1)
                    .padding(.top, 10)
                
                TextField("Username", text: $username)
                    .frame(height: 40)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(.black, lineWidth: 1)
                    )
                    .padding(.horizontal, 1)
                    .padding(.top, 10)
                  
                    
                var passwordsMatch: Bool {
                       return password == confirmPassword
                   }
                   
                           SecureField("Password", text: $password)
                               .frame(height: 40)
                           .textFieldStyle(RoundedBorderTextFieldStyle())
                           .overlay(
                               RoundedRectangle(cornerRadius: 10)
                                   .stroke(.black, lineWidth: 1)
                           )
                           .padding(.horizontal, 1)
                           .padding(.top, 10)
                         
                           
                           SecureField("Confirm Password", text: $confirmPassword)
                               .frame(height: 40)
                               .textFieldStyle(RoundedBorderTextFieldStyle())
                               .overlay(
                                   RoundedRectangle(cornerRadius: 10)
                                       .stroke(.black, lineWidth: 1)
                               )
                               .padding(.horizontal, 1)
                               .padding(.top, 10)
                             
                           
                           Text(passwordsMatch ? "Passwords match" : "Passwords do not match")
                               .foregroundColor(passwordsMatch ? Color("DarkGreen") : .red)
                               .padding()
                           
                           Button(action: {
                               registerUser(email: email, password: password, username: username) { error in
                                   if let error = error {
                                       print("Error registering user: \(error.localizedDescription)")
                                   } else {
                                       print("User successfully registered")
                                       IsRegisteredIn = true
                                   }
                               }
                           }, label: {
                               Text("Sign up")
                                   .frame(maxWidth: .infinity)
                                   .padding()
                                   .foregroundColor(.black)
                                   .background(Color("DarkGreen"))
                                   .cornerRadius(10)
                                   .overlay(
                                       RoundedRectangle(cornerRadius: 10)
                                           .stroke(.black, lineWidth: 2)
                                           
                                           
                                   )
                           })
                HStack {
                    Text("Already have an account?")
                    NavigationLink(destination: {
                        LoginView()
                    }, label: {
                        Text("Login")
                            .foregroundColor(Color("DarkGreen"))
                    })
                    
                }
                
                Spacer()
        
                       }
                       .padding()
            
            }
            .navigationBarHidden(true)
        }
    
    func registerUser(email: String, password: String, username: String, completion: @escaping (Error?) -> Void) {
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
            if let error = error {
                // Handle registration error
                completion(error)
            } else if let user = authResult?.user {
                // User successfully registered, now save additional user info to Firestore
                let userData: [String: Any] = [
                    "username": username,
                    "name": "",
                    "bio": "",
                    "dateOfBirth": ""
                ]
                
                let db = Firestore.firestore()
                let userDocRef = db.collection("users").document(user.uid)
                
                userDocRef.setData(userData) { error in
                    if let error = error {
                        // Handle Firestore data save error
                        completion(error)
                    } else {
                        // User info saved successfully
                        completion(nil)
                    }
                }
            }
        }
    }
    
}


   
struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
