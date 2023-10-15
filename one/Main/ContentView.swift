//
//  ContentView.swift
//  one
//
//  Created by sal on 09/09/2023.
//

import SwiftUI

struct ContentView: View {
    
    
    var body: some View {
        NavigationStack{
            VStack {
                Spacer()
                Image("one 1")
                    .frame(width: 200, height: 200)
                Spacer()
                HStack {
                    
                    NavigationLink{
                        LoginView()
                       
                    }
    label: {
                        Text("Login")
                            .frame(maxWidth: 80)
                            .padding()
                            .foregroundColor(.black)
                            .background(Color("DarkGreen"))
                            .cornerRadius(10)
                    }
                    NavigationLink{
                       
                        RegisterView()
                        
                    }label: {
                        Text("Register")
                            .frame(maxWidth: 80)
                            .padding()
                            .foregroundColor(.black)
                            .background(Color("DarkGreen"))
                            .cornerRadius(10)
                    }
                }
            }
            .frame(maxWidth: .infinity)
            .background(.black)
        }
    }
    }


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

