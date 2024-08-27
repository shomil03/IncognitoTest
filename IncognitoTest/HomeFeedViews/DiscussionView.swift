//
//  DiscussionView.swift
//  IncognitoTest
//
//  Created by Shomil Singh on 19/08/24.
//

import SwiftUI

struct DiscussionView: View  , Hashable{
    static func == (lhs: DiscussionView, rhs: DiscussionView) -> Bool {
        return lhs.$viewmodel.id == rhs.$viewmodel.id && lhs.$user.id == rhs.$user.id
    }
    func hash(into hasher: inout Hasher) {
        // Hash relevant properties
        hasher.combine($viewmodel.id)
        hasher.combine($user.id)
    }
    @Binding var viewmodel : ViewModel
    @Binding var user : User
    @Environment(\.dismiss) var dismiss
//    var bomberComments : [String] = []
//    var normalComments : [String] = []
    
    var lightDark = Color(red: 32/255, green: 32/255, blue: 32/255)
    var body: some View {
//        NavigationStack{
            ZStack {
                
                Color(.black)
                    .ignoresSafeArea()
                if(user.isLoading){
                    ProgressView()
                }
                else{
                    VStack(spacing: 0){
                        ScrollView{
                            LazyVStack(alignment: .leading){
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
                            .padding(.bottom)
                        
                    }
                    .ignoresSafeArea(edges : .bottom)
                }
            }
            .onAppear{
                print("reloads here")
                if(viewmodel.dismissViews){
                    
                    dismiss()
                    print("in if but didnt dismissed")
                }
                helloWorld()
                Task{
                    user.isLoading = true
                    print("fetching users")
                    user.loadValidBomberComments()
                    user.normalComments = await user.fetchNormalComments()
                    user.isLoading = false
                }
            }
            
//                user.loadValidBomberComments()
//                user.fetchNormalComments(completion: {comments in
//                    normalComments = comments
//                })
            
        }
//    }
    func helloWorld(){
        print("hello World")
    }
}

#Preview {
    DiscussionView(viewmodel: .constant(ViewModel()), user: .constant(User()))
}
