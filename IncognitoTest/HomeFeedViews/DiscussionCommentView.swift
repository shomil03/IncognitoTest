//
//  DiscussionCommentView.swift
//  IncognitoTest
//
//  Created by Shomil Singh on 20/08/24.
//

import SwiftUI

struct DiscussionCommentView: View {
    @Binding var viewmodel : ViewModel
    var comment : String = "Lorem Ipsum has been industry's standard dummy text ever since the 1500s, when an unknown printer took a gallery of type and scrambled it to make a type specimen book . It has survived not only five centuries."
    @State var liked = false
    @State var liked_count = 254
    @State var disliked = false
    @State var disliked_count = 50
    var profileImage : String = "ProfileImage"
    var username : String = "username"
    var lightDark = Color(red: 32/255, green: 32/255, blue: 32/255)
    var isBomber : Bool = true
    var totalTime = 60.0
    var remainingTime = 60.0
    var body: some View {
        ZStack{
            Color(lightDark)
                .ignoresSafeArea()
            HStack(alignment : .top){
                Image(profileImage)
                    .resizable()
                    .frame(width: 30 , height: 30)
                    .clipShape(Circle())
                    .padding(.horizontal)
                VStack(alignment: .leading){
                    HStack{
                        Text(username)
                            .font(.headline)
                        //                                        .padding(.vertical)
                        Spacer()
                        if(isBomber){
                            CircularTimerView(total: 60, elapsed: totalTime-remainingTime, viewmodel: $viewmodel, width: 25, height: 25, image: "person")
//                            ProfileView(total: totalTime, elapsed: totalTime - remainingTime, viewmodel: $viewmodel, width: 25, height: 25,image: "gauge.with.needle.fill")
                        }
                        Label("", systemImage: "ellipsis")
                            .labelsHidden()
                            .padding(.horizontal)
                    }
                    //                .padding(.top)
                    Text(comment)
                        .font(.callout)
                        .padding(.trailing)
                        .padding(.vertical,8)
                    //                    .alignment(.leading)
                    HStack{
                        
                        Label("\(liked_count)", systemImage: liked ? "arrowshape.up.fill" :  "arrowshape.up")
                            .font(.caption)
                            .foregroundStyle(liked ? Color(.green) : Color(.white))
                            .onTapGesture {
                                liked.toggle()
                                if(liked){
                                    liked_count += 1
                                    if(disliked){
                                        disliked_count -= 1
                                    }
                                    disliked = false
                                }
                                else{
                                    liked_count -= 1
                                }
                            }
                        Spacer()
                        Label("\(disliked_count)" , systemImage: disliked ?
                              "arrowshape.down.fill" : "arrowshape.down")
                        .font(.caption)
                        .foregroundStyle(disliked ? Color(.red) : Color(.white))
                        .onTapGesture {
                            disliked.toggle()
                            if(disliked){
                                disliked_count += 1
                                if(liked){
                                    liked_count -= 1
                                }
                                liked = false
                            }
                            else{
                                disliked_count -= 1
                            }
                        }
                        Spacer()
                        Label("", systemImage: "square.and.arrow.up")
                            .labelsHidden()
                            .font(.caption)
                        Spacer()
                        NavigationLink("show this discussion", destination: ContentUnavailableView("Not available right now", image: ""))
                            .font(.caption)
                            .foregroundStyle(Color(.blue))
                        Spacer()
                    }
                    .animation(.easeIn, value: liked)
                    .animation(.easeIn, value: disliked)
                }
            }
            .onAppear{
                print("bomber Remaining time \(remainingTime) total time \(totalTime)")
            }
            .foregroundStyle(Color(.white))
            .padding(.vertical)
            .background(Color(lightDark))
        }
    }
}

#Preview {
    DiscussionCommentView(viewmodel: .constant(ViewModel()))
}
