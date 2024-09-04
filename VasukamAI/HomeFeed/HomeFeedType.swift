//
//  ProfileFeedType.swift
//  IncognitoTest
//
//  Created by Shomil Singh on 30/08/24.
//

import SwiftUI

struct HomeFeedType: View {
    var body: some View {
        HStack{
            Spacer()
            Image(systemName: "photo")
                .font(.title)
            Spacer()
            Image(systemName: "bolt")
                .font(.title)
            Spacer()
            Image(systemName: "plus")
                .font(.title)
            Spacer()
            Image(systemName:"square.and.pencil")
                .font(.title)
            Spacer()
            Image(systemName: "atom")
                .font(.title)
            Spacer()
        }
        .foregroundStyle(Color(.white))
    }
}

#Preview {
    HomeFeedType()
}
