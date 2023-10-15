//
//  AddPostView.swift
//  one
//
//  Created by tabarek alawcee on 15/10/2023.
//

import SwiftUI
import Firebase

struct AddPostView: View {
    @State var postsActive: Bool = true
    
    @State private var postTitle: String = ""
    @State private var postImage: String = ""
    
    @State private var thoughtTitle: String = ""
    @State private var thoughtDescription: String = ""
    
    @State private var IsPosted: Bool = false
    
    var body: some View {
        
        if IsPosted {
            Home_Page(selectedTab: 4)
            
        } else {
            content
        }
        
    }
    
    var content: some View {
        VStack {
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
            
            if postsActive == true {
                posts
            } else {
                thoughts
            }
        }
    }
    
    

    var posts: some View {
        
        NavigationView {
            VStack {
                
                Text("Share New Post")
                    .font(.system(size: 25))
                
                TextField("Post Title", text: $postTitle)
                    .frame(height: 40)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(.black, lineWidth: 1)
                    )
                    .padding(.horizontal, 1)
                    .padding(.top, 10)
                
                TextField("Post Image", text: $postImage)
                    .frame(height: 40)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(.black, lineWidth: 1)
                    )
                    .padding(.horizontal, 1)
                    .padding(.top, 10)
                  
                    
                
                           
                           Button(action: {
                               postPost(postTitle: postTitle, postImage: postImage) { error in
                                   if let error = error {
                                       print("Error posting: \(error.localizedDescription)")
                                   } else {
                                       print("Post successfully created")
                                       IsPosted = true
                                   }
                               }
                           }, label: {
                               Text("Add Post")
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
                
                Spacer()
        
                       }
                       .padding()
            
            }
            .navigationBarHidden(true)
        }
    
    var thoughts: some View {
        
        NavigationView {
            VStack {
                
                Text("Share New Thought")
                    .font(.system(size: 25))
                
                TextField("Thought Title", text: $thoughtTitle)
                    .frame(height: 40)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(.black, lineWidth: 1)
                    )
                    .padding(.horizontal, 1)
                    .padding(.top, 10)
                
                TextEditor(text: $thoughtDescription)
                    .frame(height: 140)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(.black, lineWidth: 1)
                    )
                    .padding(.horizontal, 1)
                    .padding(.top, 10)
                  
                    
                
                           
                           Button(action: {
                               postThought(thoughtTitle: thoughtTitle, thoughtDescription: thoughtDescription) { error in
                                   if let error = error {
                                       print("Error posting: \(error.localizedDescription)")
                                   } else {
                                       print("Post successfully created")
                                       IsPosted = true
                                   }
                               }
                           }, label: {
                               Text("Add Thought")
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
                
                Spacer()
        
                       }
                       .padding()
            
            }
            .navigationBarHidden(true)
        }
    
    
    func postThought(thoughtTitle: String, thoughtDescription: String, completion: @escaping (Error?) -> Void) {
        guard let currentUser = Auth.auth().currentUser else {
            // User is not logged in
            completion(NSError(domain: "", code: 401, userInfo: [NSLocalizedDescriptionKey: "User not logged in"]))
            return
        }

        // Get the logged-in user's username
        // Assuming you have a function to retrieve the username for the logged-in user
        getUsername(forUserID: currentUser.uid) { username, error in
            if let error = error {
                // Handle the error
                completion(error)
                return
            }

            // Thought data
            let thoughtData: [String: Any] = [
                "thoughtTitle": thoughtTitle,
                "thoughtDescription": thoughtDescription,
                "username": username
            ]

            // Save the thought to the "thoughts" collection
            let db = Firestore.firestore()
            db.collection("thoughts").addDocument(data: thoughtData) { error in
                if let error = error {
                    // Handle Firestore data save error
                    completion(error)
                } else {
                    // Thought saved successfully
                    completion(nil)
                }
            }
        }
    }
    
    func postPost(postTitle: String, postImage: String, completion: @escaping (Error?) -> Void) {
        guard let currentUser = Auth.auth().currentUser else {
            // User is not logged in
            completion(NSError(domain: "", code: 401, userInfo: [NSLocalizedDescriptionKey: "User not logged in"]))
            return
        }

        // Get the logged-in user's username
        // Assuming you have a function to retrieve the username for the logged-in user
        getUsername(forUserID: currentUser.uid) { username, error in
            if let error = error {
                // Handle the error
                completion(error)
                return
            }

            // Post data
            let postData: [String: Any] = [
                "postTitle": postTitle,
                "postImage": postImage,
                "username": username
            ]

            // Save the post to the "posts" collection
            let db = Firestore.firestore()
            db.collection("posts").addDocument(data: postData) { error in
                if let error = error {
                    // Handle Firestore data save error
                    completion(error)
                } else {
                    // Post saved successfully
                    completion(nil)
                }
            }
        }
    }

    // Function to retrieve the username for a given userID
    func getUsername(forUserID userID: String, completion: @escaping (String?, Error?) -> Void) {
        let db = Firestore.firestore()
        let userDocRef = db.collection("users").document(userID)

        userDocRef.getDocument { snapshot, error in
            if let error = error {
                completion(nil, error)
                return
            }

            if let data = snapshot?.data(), let username = data["username"] as? String {
                completion(username, nil)
            } else {
                completion(nil, NSError(domain: "", code: 404, userInfo: [NSLocalizedDescriptionKey: "Username not found"]))
            }
        }
    }

}

struct AddPostView_Previews: PreviewProvider {
    static var previews: some View {
        AddPostView()
    }
}
