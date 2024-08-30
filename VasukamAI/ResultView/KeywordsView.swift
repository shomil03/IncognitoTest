//
//  KeywordsView.swift
//  IncognitoTest
//
//  Created by Shomil Singh on 29/08/24.
//

import SwiftUI

struct KeywordsView: View {
    var keywords = ["cars" , "automobile"  , "aero" , "lamborghini" , "future" , "aero"]
    var body: some View {
        VStack(alignment : .leading){
            Text("Keywords")
                .foregroundStyle(Color(.white).opacity(0.5))
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 100))] , alignment: .leading){
                ForEach(keywords , id: \.self){keyword in
                    Text(keyword)
                        .padding()
                        .background(Color(.lightDark))
                        .clipShape(RoundedRectangle(cornerRadius: 25))
                        .foregroundStyle(Color(.white))
                }
            }
        }
        
    }
}

#Preview {
    KeywordsView()
}
