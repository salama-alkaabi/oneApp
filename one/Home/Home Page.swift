//
//  Home Page.swift
//  one
//
//  Created by tabarek alawcee on 12/10/2023.
//

import SwiftUI
import Firebase


struct Home_Page: View {
    
    @State var selectedTab: Int = 2
    @State var postsActive: Bool = true
    
    @State var postsArray: [Post] = []
    @State var thoughtsArray: [Thought] = []
    
    var body: some View {
        
        TabView(selection: $selectedTab) {
            
            ChatView()
                .tabItem {
                    Label("Chat", systemImage: "message.fill")
                }
                .tag(0)
            SearchView()
                .tabItem {
                    Label("Search", systemImage: "magnifyingglass")
                }
                .tag(1)
            
            content
                .tabItem {
                    Label("Home", systemImage:"house.fill")
                }
                .tag(2)

            
            
            ShareView()
                .tabItem {
                    Label("Share", systemImage: "arrowshape.turn.up.right.fill")
                }
                .tag(3)
            
            ProfileView(username: "o4ucf", profileImage: "profileimage", name: "fatima", bio: "designing and brainstorming", highlightImage: "highlightimage", posts: 7, interests: 14)
                .tabItem {
                    Label("Profile", systemImage: "person.fill")
                }
                .tag(4)
        }
        .accentColor(Color("DarkGreen"))
        
    }
    
    var content: some View {
        NavigationView {
            ZStack {
                VStack {
                    HStack{
                        Text("One")
                            .font(.system(size: 30))
                            .padding(.leading, 20)
                        Spacer()
                    }
                    Divider()
                    Spacer()
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
                                posts
                                    
                            } else {
                                thoughts
                            }
                            
                            
                        }
                        Spacer()
                    }
                    
                    Spacer()
                    Divider()
                }
            }
        }
        
        .navigationBarHidden(true)
    }
    
    var posts: some View {
        VStack {
            // Display the posts using HomePostsView
                        ForEach(postsArray, id: \.postTitle) { post in
                            HomePostsView(profileImage: "person.crop.circle", userName: post.username, postImage: post.postImage)
                        }
        }
        .onAppear {
            fetchPosts { retrievedPosts, error in
                                if let retrievedPosts = retrievedPosts {
                                    postsArray = retrievedPosts
                                } else if let error = error {
                                    print("Error fetching posts: \(error.localizedDescription)")
                                }
                            }
        }
    }
    
    var thoughts: some View {
        VStack {
            ForEach(thoughtsArray, id: \.thoughtTitle) { thought in
                HomeThoughtsView(profileImage: "profileimage", userName: thought.username, thought: thought.thoughtDescription, comment: "")
            }
        }
        .onAppear {
            fetchThoughts { retrievedThoughts, error in
                if let retrievedThoughts = retrievedThoughts {
                        thoughtsArray = retrievedThoughts
                    } else if let error = error {
                print("Error fetching posts: \(error.localizedDescription)")
                }
            }
        }
    }
    
    


    func fetchPosts(completion: @escaping ([Post]?, Error?) -> Void) {
        let db = Firestore.firestore()
        db.collection("posts").getDocuments { snapshot, error in
            if let error = error {
                completion(nil, error)
                return
            }

            var posts: [Post] = []

            for document in snapshot?.documents ?? [] {
                let data = document.data()

                if !data.isEmpty {
                    guard let username = data["username"] as? String,
                          let postImage = data["postImage"] as? String,
                          let postTitle = data["postTitle"] as? String else {
                        print("Failed to extract username, postImage, or postTitle from data.")
                        continue
                    }

                    let post = Post(username: username, postImage: postImage, postTitle: postTitle)
                    posts.append(post)
                } else {
                    print("Data is empty for a document.")
                }
            }


            completion(posts, nil)
        }
    }
    
    func fetchThoughts(completion: @escaping ([Thought]?, Error?) -> Void) {
        let db = Firestore.firestore()
        db.collection("thoughts").getDocuments { snapshot, error in
            if let error = error {
                completion(nil, error)
                return
            }

            var thoughts: [Thought] = []

            for document in snapshot?.documents ?? [] {
                let data = document.data()

                if !data.isEmpty {
                    guard let username = data["username"] as? String,
                          let thoughtTitle = data["thoughtTitle"] as? String,
                          let thoughtDescription = data["thoughtDescription"] as? String else {
                        print("Failed to extract username, postImage, or postTitle from data.")
                        continue
                    }

                    let thought = Thought(username: username, thoughtTitle: thoughtTitle, thoughtDescription: thoughtDescription)
                        thoughts.append(thought)
                } else {
                    print("Data is empty for a document.")
                }
            }


            completion(thoughts, nil)
        }
    }


}

struct Home_Page_Previews: PreviewProvider {
    static var previews: some View {
        Home_Page()
    }
}
