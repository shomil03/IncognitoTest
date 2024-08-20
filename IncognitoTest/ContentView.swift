//
//  ContentView.swift
//  IncognitoTest
//
//  Created by Shomil Singh on 06/08/24.
//

import SwiftUI
//import
struct ContentView: View {
    @State var viewmodel = ViewModel()
    @State var user = User()
    var body: some View {
        NavigationStack{
            if(user.incognitoStarted){
                IncognitoView(viewmodel: $viewmodel ,
                              user: $user)
            }
            else{
                ZStack{
                    ZStack{
                        ScrollView {
                            ForEach(0 ..< 5){_ in
                                Rectangle()
                                    .frame(width: 300 , height: 200)
                                    .foregroundStyle(Color.gray)
                                Text("Post")
                            }
                        }
                        .scrollIndicators(.hidden)
                        .disabled(viewmodel.viewDisabled)
                    }
                    .overlay(alignment: .topLeading){
                        Button(action: {
                            withAnimation(.easeOut){
                                viewmodel.isShowingSideMenu.toggle()
                            }
                        }, label: {
                            Label("", systemImage : "line.3.horizontal" )
                                .font(.title2)
                                .labelsHidden()
                        })
                        .offset(x: -30, y: 0)
                        
                    }
                    .sheet(item: $viewmodel.sheetType, content: {sheet in
                        switch sheet{
                            case .first:
                                FirstSheet(viewmodel: $viewmodel)
                                    .presentationDetents([.medium])
                            case .second:
                                SecondSheet(viewmodel: $viewmodel)
                            case .third:
                                ThirdSheet(user: $user, viewmodel: $viewmodel)
                                    .presentationDetents([.medium])
                        }
                    })
                    .presentationCornerRadius(100)
                    if(viewmodel.isShowingSideMenu){
                        HStack{
                            SideBarMenu(viewmodel: $viewmodel)
                            Color.secondary.opacity(0.01)
                                .ignoresSafeArea()
                                .padding(.leading , -8)
                                .onTapGesture {
                                    withAnimation(){
                                        viewmodel.isShowingSideMenu = false
                                    }
                                }
                        }
                        .transition(.move(edge: .leading))
                    }
                }
            }
            
            
        }
    }
    
}

#Preview {
    ContentView()
}
