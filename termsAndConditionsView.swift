//
//  termsAndConditionsView.swift
//  one
//
//  Created by sal on 30/09/2023.
//

import SwiftUI

struct termsAndConditionsView: View {
    
    
    @State private var showGreeting = true
    
    var body: some View {
        ZStack {
            
            VStack {
                Text("Please read these terms and conditions carefully. Conditions of use : By using this app, you certify that you have read and reviewed this Agreement and that you agree to comply with its terms. Age restriction. : You must be at least 15 (eighteen) years of age before you can use this app. Privacy Policy : You agree that all materials, products, and services provided on this app are with privacy. User accounts : As a user of this app, you may be asked to register with us and provide private information. Copyright : By using this app, you certify that each users information and posts are copyright to them. if you use it by your name ,you will be charged in court. Disputes : Any dispute related in any way to your use of this app or to products you purchase from us shall be arbitrated by state or federal court ")
                
                    .bold()
                    .italic()
                    .padding()
                
                
                
                
                
                Toggle("I Agree To These Terms And Conditions ", isOn: $showGreeting)
                    .bold()
                    .italic()
                    .padding()
                
            }
            
        }
    }
       
}
        

struct termsAndConditionsView_Previews: PreviewProvider {
    static var previews: some View {
        termsAndConditionsView()
    }
}
