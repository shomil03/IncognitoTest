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
    var lightDark = Color(red: 32/255, green: 32/255, blue: 32/255)
    var body: some View {
        NavigationStack{
            ZStack{
                
                Color(lightDark)
                    .ignoresSafeArea()
                    .onReceive(timer){_ in
                        coolDown -= 1
                        print(coolDown)
                        if(coolDown <= 0){
                            user.incognitoStarted = false
                        }
                    }
                
                VStack {
//                    Text("\(coolDown)")
                    FeedTopBar(elapsed: 30-coolDown, viewmodel: $viewmodel)
                            .padding(.bottom)
                        FeedType()
                            .foregroundStyle(Color(.white))
                            .padding(.bottom)
                    ScrollView(){
                        LazyVStack{
                            ForEach(0 ..< 10){_ in
                                HomeContentView(viewmodel: $viewmodel, user: $user)
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
//            .toolbar{
//                ToolbarItem(placement: .bottomBar){
//                    CustomTabBar()
////                }
//            }
            .animation(.spring , value: viewmodel.isProfileViewTapped)
            .onAppear{
                coolDown = user.calculateTimeDifferences()
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
