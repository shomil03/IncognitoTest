//
//  ContentTopView.swift
//  IncognitoTest
//
//  Created by Shomil Singh on 15/08/24.
//

import SwiftUI

struct ContentTopView: View {
    var username : String = "that_guy"
    var body: some View {
        HStack{
            Image("ProfileImage")
                .resizable()
                .scaledToFit()
                .frame(width: 40 , height: 40)
                .clipShape(Circle())
                .padding(.leading)
            
            Text(username)
            Spacer()
            Label("", systemImage: "bookmark")
                .labelsHidden()
            Label("" , systemImage: "ellipsis")
                .labelsHidden()
                .rotationEffect(Angle(degrees: -90) , anchor: .leading)
                .padding(.top)
                
        }
//        .border(Color.black)
    }
}

#Preview {
    ContentTopView()
}
