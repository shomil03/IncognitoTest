//
//  AIProfileFeedType.swift
//  IncognitoTest
//
//  Created by Shomil Singh on 28/08/24.
//

import SwiftUI

struct AIProfileFeedType: View {
    var body: some View {
        HStack{
            Spacer()
            Image(systemName: "photo")
                .resizable()
                .frame(width: 32 , height: 32)
                .scaledToFit()
            Spacer()
            Image(systemName: "bolt")
                .resizable()
                .frame(width: 32 , height: 32)
                .scaledToFit()
            Spacer()
            Image(systemName:"square.and.pencil")
                .resizable()
                .frame(width: 32 , height: 32)
                .scaledToFit()
            Spacer()
            Image(systemName: "atom")
                .resizable()
                .frame(width: 32 , height: 32)
                .scaledToFit()
            Spacer()
        }
        .foregroundStyle(Color(.white).opacity(0.7))
    }
}

#Preview {
    AIProfileFeedType()
}
