//
//  SwiftUIView.swift
//  one
//
//  Created by tabarek alawcee on 11/10/2023.
//

import SwiftUI

struct Post: Identifiable {
    let id = UUID()
    let username: String
    let caption: String
}

struct ContentView: View {
    let posts: [Post] = [
        Post(username: "user1", caption: "Lorem ipsum dolor sit amet, consectetur adipiscing elit."),
        Post(username: "user2", caption: "Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.")
    ]

    var body: some View {
        NavigationView {
            List(posts) { post in
                VStack(alignment: .leading) {
                    Text(post.username)
                        .font(.headline)
                    Text(post.caption)
                        .font(.body)
                }
            }
            .navigationBarTitle("Instagram", displayMode: .inline)
        }
    }
}

    struct ContentView_Previews: PreviewProvider {
           static var previews: some View {
                ContentView()
    }
}

@main
struct MyApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
