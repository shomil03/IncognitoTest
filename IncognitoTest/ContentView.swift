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
            ZStack{
                ZStack{
                    ScrollView {
                        ForEach(0 ..< 5){_ in
                            Rectangle()
                                .frame(width: 300 , height: 200)
                                .foregroundStyle(Color.gray)
                            Text("Post")
                        }
//                        Text("Home View")
//                        Button("tap me"){}

                    }
                    .scrollIndicators(.hidden)
                    .disabled(viewmodel.viewDisabled)
//                    .border(Color.black)

                }
                .toolbar{
//                    if(!viewmodel.isShowingSideMenu){
                        ToolbarItem(placement: .topBarLeading){
                            Button(action: {
                                withAnimation(.easeOut){
                                    viewmodel.isShowingSideMenu.toggle()
                                }
                                
                            }, label: {
                                Label("", systemImage : "line.3.horizontal" )
                                    .labelsHidden()
                            })
                            
                            
                        }
//                    }
                }
                .sheet(item: $viewmodel.sheetType, content: {sheet in
                    switch sheet{
                        case .first:
                            FirstSheet(viewmodel: $viewmodel)
                                .presentationDetents([.medium])
                        case .second:
                            SecondSheet(viewmodel: $viewmodel)
                        case .third:
                            ThirdSheet(user: $user)
                                .presentationDetents([.medium])
                    }
                })
                if(viewmodel.isShowingSideMenu){
                    HStack{
                        SideBarMenu(viewmodel: viewmodel)
                        Color.secondary.opacity(0.01)
                            .ignoresSafeArea()
                            .padding(.leading , -8)
                            .onTapGesture {
                                withAnimation(.easeOut){
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

#Preview {
    ContentView()
}
