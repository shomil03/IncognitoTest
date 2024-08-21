//
//  DiscussionView.swift
//  IncognitoTest
//
//  Created by Shomil Singh on 19/08/24.
//

import SwiftUI

struct DiscussionView: View {
    @Binding var viewmodel : ViewModel
    @Binding var user : User
    @State var bomberComments : [String] = []
    @State var normalComments : [String] = []
    var body: some View {
        NavigationStack{
            VStack(spacing: 0){
                ScrollView{
                    LazyVStack(alignment: .leading){
//                        ForEach(0..<5 , id: \.self){_ in
//                            DiscussionCommentView()
//                        }
                        ForEach(0..<bomberComments.count ,id : \.self ){index in
                            DiscussionCommentView(viewmodel: $viewmodel, comment : bomberComments[index] , profileImage: "ProfileImage", username: "anonymous")
//                            Text(bomberComments[index])
                        }
                        ForEach(0..<normalComments.count , id: \.self){index in
                            DiscussionCommentView(viewmodel: $viewmodel, comment: normalComments[index], profileImage: "ProfileImage", username: "username")
                        }
                    }
                }
                CustomTextFieldView(user: $user, viewmodel: $viewmodel)
                    
            }
            .ignoresSafeArea(edges : .bottom)
            .onAppear{
                user.fetchValidBomberComments(completion: {comments in
                    bomberComments = comments
                    print(bomberComments)
                })
                user.fetchNormalComments(completion: {comments in
                    normalComments = comments
                })
            }
            
        }
    }
}

#Preview {
    DiscussionView(viewmodel: .constant(ViewModel()), user: .constant(User()))
}
