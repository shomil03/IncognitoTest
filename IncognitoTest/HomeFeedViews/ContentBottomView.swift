//
//  ContentBottonView.swift
//  IncognitoTest
//
//  Created by Shomil Singh on 16/08/24.
//

import SwiftUI

struct ContentBottomView: View {
    var body: some View {
        HStack{
            Spacer()
            Label("", systemImage: "paperplane")
                .labelsHidden()
                .rotationEffect(Angle(degrees: 45))
            Spacer()
            Label("", systemImage: "trophy")
                .labelsHidden()
            Spacer()
            Label("", systemImage: "ellipsis.bubble")
                .labelsHidden()
            Spacer()
            Label("", systemImage: "flame")
                .labelsHidden()
            Spacer()
            
        }
    }
}

#Preview {
    ContentBottomView()
}
