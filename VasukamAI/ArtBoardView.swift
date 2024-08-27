//
//  ArtBoardView.swift
//  IncognitoTest
//
//  Created by Shomil Singh on 28/08/24.
//

import SwiftUI

struct ArtBoardView: View {
    var title : String = "ARTBOARD"
    var body: some View {
        VStack(alignment : .leading){
            Text(title)
            HStack{
                Text("W")
                    .foregroundStyle(Color(.white))
                Text("1080")
                    .frame(width: 80)
                    .padding()
                    .background(Color(.lightDark))
                    .foregroundStyle(Color.white)
                    .clipShape(RoundedRectangle(cornerRadius: 15))
                Text("H")
                    .foregroundStyle(Color(.white))
                Text("1080")
                    .frame(width: 80)
                    .padding()
                    .background(Color(.lightDark))
                    .foregroundStyle(Color.white)
                    .clipShape(RoundedRectangle(cornerRadius: 15))
                Image(systemName: "link")
                    .foregroundStyle(Color(.white).opacity(0.3))
                    .padding(.horizontal)
            }
        }
    }
}

#Preview {
    ArtBoardView()
}
