//
//  FeedType.swift
//  IncognitoTest
//
//  Created by Shomil Singh on 15/08/24.
//

import SwiftUI

struct FeedType: View {
    
    var body: some View {
        HStack{
            Spacer()
            Text("Main")
                .fontWeight(.heavy)
            Spacer()
            Text("Trending")
            Spacer()
            Text("Explore")
            Spacer()
            Label("", systemImage: "line.2.horizontal.decrease.circle.fill")
                .labelsHidden()
                .padding(.trailing)
            
        }
    }
}

#Preview {
    FeedType()
}
