//
//  ContentBottonView.swift
//  IncognitoTest
//
//  Created by Shomil Singh on 16/08/24.
//

import SwiftUI

struct ContentBottomView: View {
    @Binding var viewmodel : ViewModel
    @Binding var user : User
    @Binding var navigationPath: NavigationPath
    var body: some View {
//        NavigationStack{
            ZStack{
//                Color(.black)
//                    .ignoresSafeArea()
                HStack{
                    Spacer()
                    Label("", systemImage: "paperplane")
                        .labelsHidden()
                        .rotationEffect(Angle(degrees: 45))
                    Spacer()
                    Label("", systemImage: "trophy")
                        .labelsHidden()
                    Spacer()
//                    NavigationLink(destination: DiscussionView(viewmodel: $viewmodel, user: $user), label: {
//                        Label("", systemImage: "ellipsis.bubble")
//                            .labelsHidden()
//                    })
                    Button(action: {
                        // Navigate to DiscussionView using navigationPath
                        navigationPath.append(DiscussionView(viewmodel: $viewmodel, user: $user))
                    }) {
                        Label("", systemImage: "ellipsis.bubble")
                            .labelsHidden()
                    }
                    Spacer()
                    Label("", systemImage: "flame")
                        .labelsHidden()
                    Spacer()
                }
                .foregroundStyle(Color(.white))
                .font(.title2)
                //            .background(Color.black)
            }
        }
        
//    }
}

#Preview {
    ContentBottomView(viewmodel: .constant(ViewModel()), user: .constant(User()), navigationPath: .constant(NavigationPath()))
}
