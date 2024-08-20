//
//  ContentCommentView.swift
//  IncognitoTest
//
//  Created by Shomil Singh on 16/08/24.
//

import SwiftUI

struct ContentCommentView: View {
    var comment : String = "Bringing the heat to California under 18 State swimming tials"
    var largeComment : String = "Time to dry off and hit the road to Zandvoort The lap that counted .Jump abroad for anyone and more long text are there to come"
    var truncatedLength : Int = 130
    @State var isExpanded = false
    var body: some View {
        VStack(alignment: .leading){
            HStack{
                CommentProfileView()
                    .padding(.leading,30)
                Text("@xyz and 95 others awarded")
                    .font(.caption)
            }
            Text(comment)
                .bold()
            
            Text(isExpanded ? largeComment : DemoComment)
                .lineLimit(isExpanded ? nil : 2)
                .font(.caption)
                .padding(.top ,3)
            if(!isExpanded && largeComment.count > truncatedLength){
                
                Button(action: {
                    withAnimation{
                        isExpanded.toggle()
                    }
                }, label: {
                    Label("more", image: "")
                        .foregroundStyle(Color.gray)
                        .font(.caption)
                        .padding(.top,-5)
                        .padding(.leading,-6)
                        
                })
                
            }
            
            Text("California . 3 hours ago")
                .font(.caption)
                .fontWeight(.semibold)
                .padding(.top ,3)
            
        }
    }
    var DemoComment : String {
        largeComment.prefix(truncatedLength) + (largeComment.count > truncatedLength ? "...": "")
    }
    
}
struct CommentProfileView : View {
    var body: some View {
        ZStack{
            Circle()
                .overlay{
                    Circle()
                        .stroke(Color(.yellow) , lineWidth: 3)
                        .frame(width: 20, height: 20)
                    //                                .opacity(1)
                    
                }
                .frame(width: 20,height: 20)
            Circle()
                .overlay{
                    Circle()
                        .stroke(Color(.red) , lineWidth: 3)
                        .frame(width: 20, height: 20)
                }
                .frame(width: 20 , height: 20)
//                .padding(.trailing,30)
                .offset(x: -15 , y: 0)
            Circle()
                .overlay{
                    Circle()
                        .stroke(Color.teal,lineWidth: 3)
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
