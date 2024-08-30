//
//  IncognitoView.swift
//  IncognitoTest
//
//  Created by Shomil Singh on 09/08/24.
//

import SwiftUI
import Combine
struct IncognitoView: View {
    @Binding var viewmodel : ViewModel
    @Binding var user : User
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @State var coolDown = 30.0
    @State private var navigationPath = NavigationPath()
    var lightDark = Color(red: 32/255, green: 32/255, blue: 32/255)
    @Environment(\.dismiss) var dismiss
    var body: some View {
        NavigationStack(path : $navigationPath){
            ZStack{
                
                Color(lightDark)
                    .ignoresSafeArea()
                    .onReceive(timer){_ in
                        viewmodel.cooldownTime -= 1
                        print(viewmodel.cooldownTime)
                        if(viewmodel.cooldownTime <= 0){
                            user.incognitoStarted = false
                            print("changing viewmodel dismiss views")
                            viewmodel.dismissViews = true
//                            DiscussionView(viewmodel: $viewmodel, user: $user)
                            if(navigationPath.count > 0){
                                navigationPath.removeLast()
                            }
                            dismiss()
                        }
                    }
                if(user.isLoading){
                    ProgressView()
                }
                else{
                    VStack {
                        //                    Text("\(coolDown)")
                        FeedTopBar(elapsed: 150-viewmodel.cooldownTime, viewmodel: $viewmodel)
                            .padding(.bottom)
                        FeedType()
                            .foregroundStyle(Color(.white))
                            .padding(.bottom)
                        ScrollView(){
                            LazyVStack{
                                ForEach(0 ..< 10){_ in
                                    HomeContentView(viewmodel: $viewmodel, user: $user, navigationPath: $navigationPath)
                                        .foregroundStyle(Color(.white))
                                }
                            }
                        }
                        .scrollIndicators(.hidden)
                        
                        //                    Spacer()
                        //                    Button("here"){}
                        CustomTabBar()
                        
                        //                        .padding(.bottom)
                    }
                    .ignoresSafeArea(edges : .bottom)
                    .scaleEffect(viewmodel.isProfileViewTapped ? 0.75 : 1.0)
                    .offset(x : viewmodel.isProfileViewTapped ? UIScreen.main.bounds.width * 0.55 : 0,y:0 )
                    if(viewmodel.isProfileViewTapped){
                        HStack{
                            SideBarMenu(viewmodel: $viewmodel)
                            
                            
                            Color.primary.opacity(0.01)
                                .ignoresSafeArea()
                                .onTapGesture {
                                    viewmodel.isProfileViewTapped = false
                                }
                        }
                        .transition(.move(edge: .leading))
                    }
                    
                    
                }
                
            }
            
//            .toolbar{
//                ToolbarItem(placement: .bottomBar){
//                    CustomTabBar()
//                }
//            }
            .animation(.spring , value: viewmodel.isProfileViewTapped)
            .onAppear{
                Task{
                    viewmodel.cooldownTime = await user.calculateTimeDifferences()
                }
                
            }
            .navigationDestination(for: DiscussionView.self) { discussionView in
                discussionView
            }
            
        }
    }
    func printh(){
        print("here")
    }
}

#Preview {
    IncognitoView(viewmodel: .constant(ViewModel()) ,
                  user: .constant(User()))
}
