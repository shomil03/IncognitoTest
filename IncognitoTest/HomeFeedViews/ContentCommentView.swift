//
//  ContentCommentView.swift
//  IncognitoTest
//
//  Created by Shomil Singh on 16/08/24.
//

import SwiftUI

struct ContentCommentView: View {
    var comment : String = "Bringing the heat to California under 18 State swimming tials"
    var largeComment : String = "Time to dry off and hit the road to Zandvoort"
    var body: some View {
        VStack(alignment: .leading){
            HStack{
                CommentProfileView()
                    .padding(.leading,30)
                Text("@xyz and 95 others awarded")
            }
            Text(comment)
            Text(largeComment)
            Text("California.3 hours ago")
            
        }
    }
}
struct CommentProfileView : View {
    var body: some View {
        ZStack{
            Circle()
                .overlay{
                    Circle()
                        .stroke(Color(.yellow) , lineWidth: 4)
                        .frame(width: 20, height: 20)
                    //                                .opacity(1)
                    
                }
                .frame(width: 20,height: 20)
            Circle()
                .overlay{
                    Circle()
                        .stroke(Color(.red) , lineWidth: 4)
                        .frame(width: 20, height: 20)
                }
                .frame(width: 20 , height: 20)
//                .padding(.trailing,30)
                .offset(x: -15 , y: 0)
            Circle()
                .overlay{
                    Circle()
                        .stroke(Color.teal,lineWidth: 4)
                        .frame(width: 20, height: 20)
                }
                .frame(width: 20 , height: 20)
//                .padding(.trailing,60)
                .offset(x: -30 , y: 0)
        }
    }
}
#Preview {
    ContentCommentView()
}
