//
//  ShareView.swift
//  one
//
//  Created by tabarek alawcee on 14/10/2023.
//

import SwiftUI

struct ShareView: View {
    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    Text("Share View")
                    Divider()
                    Spacer()
                    VStack{
                        Text("")
                        
                    }
                    
                    Spacer()
                    Divider()
                }
            }
        }
        .navigationBarHidden(true)
    }
}

struct ShareView_Previews: PreviewProvider {
    static var previews: some View {
        ShareView()
    }
}
