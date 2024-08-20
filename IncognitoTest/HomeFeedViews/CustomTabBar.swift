//
//  CustomTabBar.swift
//  IncognitoTest
//
//  Created by Shomil Singh on 20/08/24.
//

import SwiftUI

struct CustomTabBar: View {
    var body: some View {
        HStack{
            Spacer()
            Label("", systemImage: "house")
            Spacer()
            Label("", systemImage: "play.tv")
            Spacer()
            Label("", systemImage: "plus")
            Spacer()
            Label("", systemImage: "bolt")
            Spacer()
            Label("", systemImage: "bag")
            Spacer()
        }
        .foregroundStyle(Color(.white))
//        .frame(height: 75)
        .background(Color.black)
        .clipShape(RoundedRectangle(cornerRadius: 20))
//        .padding()
    }
}

#Preview {
    CustomTabBar()
}
