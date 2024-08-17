//
//  HomeContentView.swift
//  IncognitoTest
//
//  Created by Shomil Singh on 15/08/24.
//

import SwiftUI

struct HomeContentView: View {
    var body: some View {
        VStack{
            ContentTopView()
            RoundedRectangle(cornerRadius: 25.0)
                .frame(maxWidth: .infinity , minHeight: 250 , idealHeight: 300 , maxHeight: 350)
                .padding()
            ContentBottomView()
//                .padding(.vertical)
            ContentCommentView()
                .padding(.vertical)
        }
    }
}

#Preview {
    HomeContentView()
}
