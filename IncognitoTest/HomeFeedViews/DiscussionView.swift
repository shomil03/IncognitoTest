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
//    var bomberComments : [String] = []
//    var normalComments : [String] = []
    var body: some View {
        NavigationStack{
            VStack(spacing: 0){
                ScrollView{
                    LazyVStack(alignment: .leading){
//                        ForEach(0..<5 , id: \.self){_ in
//                            DiscussionCommentView()
//                        }
//                        ForEach(0..<user.bomberComments.count ,id : \.self ){index in
////                            withAnimation{
//                                DiscussionCommentView(viewmodel: $viewmodel, comment : user.bomberComments[index] , profileImage: "ProfileImage", username: "anonymous")
////                            }
////                            Text(bomberComments[index])
//                        }
//                        ForEach(viewmodel.bombe)
                        ForEach(user.bomberComments){comment in
//                            Text(comment.text)
                            DiscussionCommentView(viewmodel: $viewmodel, comment: comment.text, profileImage: "Memoji", username: "anonymous", isBomber: true,totalTime: 60 , remainingTime: comment.remainingTime)
                        }
                        ForEach(0..<user.normalComments.count , id: \.self){index in
//                            withAnimation{
                            DiscussionCommentView(viewmodel: $viewmodel, comment: user.normalComments[index], profileImage: "ProfileImage", username: "username" , isBomber: false)
//                            }
                        }
                    }
                }
                CustomTextFieldView(user: $user, viewmodel: $viewmodel)
                    
            }
            .ignoresSafeArea(edges : .bottom)
            .onAppear{
//                user.fetchValidBomberComments(completion: {comments in
////                    bomberComments = comments
////                    print(bomberComments)
//                })
                Task{
                    user.loadValidBomberComments()
                    let comment = await user.fetchNormalComments()
                }
//                user.loadValidBomberComments()
//                user.fetchNormalComments(completion: {comments in
//                    normalComments = comments
//                })
            }
            
        }
    }
}

#Preview {
    DiscussionView(viewmodel: .constant(ViewModel()), user: .constant(User()))
}
