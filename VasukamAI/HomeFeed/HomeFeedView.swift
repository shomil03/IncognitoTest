//
//  HomeFeedView.swift
//  IncognitoTest
//
//  Created by Shomil Singh on 30/08/24.
//

import SwiftUI

struct HomeFeedView: View {
    var body: some View {
        VStack{
            HomeFeedTopView()
            HomeFeedType()
            SlidingCardView()
            
        }
    }
}

#Preview {
    HomeFeedView()
}
