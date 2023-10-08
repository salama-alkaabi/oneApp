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
            let imageName = index > 10 ? index - (10 * (index / 10)) == 0 ? 10 : index - 10 (10 (index, / 10)) : index
            
            Image("post\(imageName)")
                .resizable()
                .aspectRatio(contentMode: ContentMode: .fill)
                .frame(width: width, height: 120)
            cornerRadius(0)
        }
    }
}

