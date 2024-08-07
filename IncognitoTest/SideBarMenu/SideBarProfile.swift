//
//  SideBarProfile.swift
//  IncognitoTest
//
//  Created by Shomil Singh on 07/08/24.
//

import SwiftUI

struct SideBarProfile: View {
    var body: some View {
        HStack{
            Image(systemName: "person.circle.fill")
                .resizable()
                .frame(width: 60 , height: 60)
                .padding(.horizontal)
            VStack{
                Text("Test User")
                    .font(.title2)
                    .fontWeight(.semibold)
                Text("View Profile")
                    .font(.callout)
                    .opacity(0.7)
            }
            .padding(.horizontal)
        }
    }
}

#Preview {
    SideBarProfile()
}
