//
//  HomeFeedToView.swift
//  IncognitoTest
//
//  Created by Shomil Singh on 30/08/24.
//

import SwiftUI

struct HomeFeedTopView: View {
    var body: some View {
        HStack(spacing : 25){
            Image("Image17")
                .resizable()
                .frame(width: 32, height: 32)
                .scaledToFit()
                .clipShape(Circle())
                .padding(.leading)
            Text("AI")
                .font(.title)
                .foregroundStyle(Color(.white))
            
            Spacer()
            Image(systemName: "magnifyingglass")
//                .resizable()
                .font(.title)
//                .scaledToFit()
                .foregroundStyle(Color(.white))
            Image(systemName: "bell.and.waves.left.and.right")
//                .resizable()
                .font(.title)
//                .frame(height: 32)
//                .scaledToFit()
                .foregroundStyle(Color(.white))
                .tag("2")
            Image(systemName: "envelope.open")
                .font(.title)
//                .resizable()
//                .frame( height: 32)
//                .scaledToFit()
                .foregroundStyle(Color(.white))
                .tag("2")
                .padding(.trailing)
            
            
        }
//        .frame(height: 32)
        .preferredColorScheme(.dark)
    }
}

#Preview {
    HomeFeedTopView()
}
