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
                .bold()
            Spacer()
            Label("", systemImage: "play.tv")
                .bold()
            Spacer()
            Label("", systemImage: "plus")
                .bold()
                .font(.title)
            Spacer()
            Label("", systemImage: "bolt")
                .bold()
            Spacer()
            Label("", systemImage: "bag")
                .bold()
            Spacer()
        }
        .foregroundStyle(Color(.white))
        .frame(height: 75)
        .background(Color.black)
        .clipShape(RoundedRectangle(cornerRadius: 20))
//        .padding()
    }
}

#Preview {
    CustomTabBar()
}
