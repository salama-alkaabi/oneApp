//
//  TapBarButtonView.swift
//  one
//
//  Created by sal on 07/10/2023.
//

import SwiftUI

struct TapBarButtonView: View {
    var image: String
    var isSystemImage : Bool

    
    @Binding var selectedTab: String
    
    var body: some View {
        Button(action: {
            withAnimation(.easeInOut){
                selectedTab = image
            }
            
        }, label: {
            VStack(spacing: 12){
                
                (isSystemImage ? Image(systemName: image) : Image(image))
                    .renderingMode(.template)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 28, height: 28)
                    .foregroundColor(selectedTab == image ? .primary : .gray)
                ZStack {
                    if selectedTab == image {
                        Rectangle()
                            .fill(Color.primary)
    
                    } else {
                        Rectangle()
                            .fill(Color.clear)
                    }
                }
                
            }
        }
        )
        

        
    }
}

struct TapBarButtonView_Previews: PreviewProvider {
    static var previews: some View {
        TapBarButtonView(image: "", isSystemImage: true,  selectedTab: .constant(""))
    }
}
