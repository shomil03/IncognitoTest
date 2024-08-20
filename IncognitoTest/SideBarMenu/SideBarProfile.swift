//
//  SideBarProfile.swift
//  IncognitoTest
//
//  Created by Shomil Singh on 07/08/24.
//

import SwiftUI

struct SideBarProfile: View {
    @Binding var viewmodel : ViewModel
    var body: some View {
        HStack{
            ProfileView(viewmodel: $viewmodel,width: CGFloat(60) , height: CGFloat(60))
//                .resizable()
//                .frame(width: 60 , height: 60)
//                .padding(.horizontal)
            VStack(alignment: .leading){
                Text("Test User")
                    .font(.title2)
                    .fontWeight(.bold)
                Text("View Profile")
                    .font(.caption)
                    .opacity(0.7)
            }
            .padding(.horizontal)
        }
    }
}

#Preview {
    SideBarProfile(viewmodel: .constant(ViewModel()))
}
