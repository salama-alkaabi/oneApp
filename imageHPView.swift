//
//  imageHPView.swift
//  one
//
//  Created by sal on 07/10/2023.
//

import SwiftUI

struct imageHPView: View {
    var index: Int
    var width: CGFloat
    var body: some View {
       
        VStack{
            let imageName = "logo"
            
            Image("post\(imageName)")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: width, height: 120)
            cornerRadius(0)
        }
    }
}

