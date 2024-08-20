//
//  FeedTopBar.swift
//  IncognitoTest
//
//  Created by Shomil Singh on 14/08/24.
//

import SwiftUI

struct FeedTopBar: View {
    var elapsed : Double = 40
    @Binding var viewmodel : ViewModel
    var body: some View {
        HStack{
            ProfileView(total: 30 , elapsed: elapsed , viewmodel: $viewmodel)
                .padding(.horizontal)
                .padding(.leading,3)
            Text("Incognito")
                .font(.title)
                .fontWeight(.bold)
                .foregroundStyle(Color(.white))
            Spacer()
            Label("", systemImage: "magnifyingglass")
                .labelsHidden()
                .foregroundStyle(Color(.white))
            Label("", systemImage: "bell.and.waves.left.and.right")
                .foregroundStyle(Color(.white))
                .labelsHidden()
            Label("", systemImage: "paperplane")
                .labelsHidden()
                .foregroundStyle(Color(.white))
                .rotationEffect(.degrees(-45))
                .padding(.trailing)
            
            
        }
    }
}

#Preview {
    FeedTopBar(viewmodel: .constant(ViewModel()))
}
