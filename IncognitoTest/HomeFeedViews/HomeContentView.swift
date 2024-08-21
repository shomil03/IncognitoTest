//
//  HomeContentView.swift
//  IncognitoTest
//
//  Created by Shomil Singh on 15/08/24.
//

import SwiftUI

struct HomeContentView: View {
    @Binding var viewmodel : ViewModel
    @Binding var user : User
    var body: some View {
        VStack{
            ContentTopView()
//                .padding(.horizontal)
            RoundedRectangle(cornerRadius: 25.0)
                .frame(maxWidth: .infinity , minHeight: 250 , idealHeight: 300 , maxHeight: 350)
                .padding()
            ContentBottomView(viewmodel: $viewmodel, user: $user)
//                .padding(.vertical)
            ContentCommentView()
                .padding()
        }
    }
}

#Preview {
    HomeContentView(viewmodel: .constant(ViewModel()), user: .constant(User()))
}
