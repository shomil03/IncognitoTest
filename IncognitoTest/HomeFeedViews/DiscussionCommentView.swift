//
//  DiscussionCommentView.swift
//  IncognitoTest
//
//  Created by Shomil Singh on 20/08/24.
//

import SwiftUI

struct DiscussionCommentView: View {
    let comment = "Lorem Ipsum has been industry's standard dummy text ever since the 1500s, when an unknown printer took a gallery of type and scrambled it to make a type specimen book . It has survived not only five centuries."
    var body: some View {
        HStack(alignment : .top){
            Image("ProfileImage")
                .resizable()
                .frame(width: 30 , height: 30)
                .clipShape(Circle())
                .padding(.horizontal)
            VStack{
                HStack{
                    Text("username")
                        .font(.headline)
                    //                                        .padding(.vertical)
                    Spacer()
                    Label("", systemImage: "ellipsis")
                        .labelsHidden()
                        .padding(.horizontal)
                }
                .padding(.top)
                Text(comment)
                    .font(.callout)
                    .padding(.trailing)
                    .padding(.vertical,8)
                HStack{
                    
                    Label("254", systemImage: "arrowshape.up")
                        .font(.caption)
                    Spacer()
                    Label("50" , systemImage: "arrowshape.down")
                        .font(.caption)
                    Spacer()
                    Label("", systemImage: "square.and.arrow.up")
                        .labelsHidden()
                        .font(.caption)
                    Spacer()
                    NavigationLink("show this discussion", destination: ContentUnavailableView("Not available right now", image: ""))
                        .font(.caption)
                    Spacer()
                }
            }
        }
    }
}

#Preview {
    DiscussionCommentView()
}
