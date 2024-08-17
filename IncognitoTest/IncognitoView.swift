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
//    var timer : AnyCancellable
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
                        FeedTopBar(elapsed: 30-coolDown)
                            .padding(.bottom)
                        FeedType()
                            .foregroundStyle(Color(.white))
                            .padding(.bottom)
                    ScrollView{
                        LazyVStack{
                            ForEach(0 ..< 10){_ in
                               HomeContentView()
                                    .foregroundStyle(Color(.white))
                            }
                        }
                    }
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    //                Text("Incognito View")
                    //                    .font(.largeTitle)
                    //                    .fontWeight(.bold)
                    //                Text("Testing remaining Time\(coolDown)")
                    //                    .onReceive(timer){_ in
                    //                        withAnimation(){
                    //                            coolDown -= 1
                    //                        }
                    //                        if(coolDown < 30 && coolDown > 0){
                    //
                    //    //                        show timer to view
                    //                        }
                    //                        if(coolDown <= 0){
                    //                            user.incognitoStarted = false
                    //    //                        return from incognito view
                    //                        }
                    //                }
                }.onAppear{
                    printh()
                    //            coolDown = (user.remainingTime)
                    coolDown = user.calculateTimeDifferences()
                }
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
