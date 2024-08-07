//
//  ContentView.swift
//  IncognitoTest
//
//  Created by Shomil Singh on 06/08/24.
//

import SwiftUI

struct ContentView: View {
    @State var viewmodel = ViewModel()
    var body: some View {
        NavigationStack{
            ZStack{
                if(viewmodel.isShowingSideMenu){
                    HStack{
                        SideBarMenu(viewmodel: viewmodel)
                    }
                }
                ZStack{
                    VStack {
                        
                        Text("Home View")
                    }
                }
                .toolbar{
                    if(!viewmodel.isShowingSideMenu){
                        ToolbarItem(placement: .topBarLeading){
                            Button(action: {
                                viewmodel.isShowingSideMenu.toggle()
                            }, label: {
                                Label("", systemImage : "line.3.horizontal" )
                                    .labelsHidden()
                            })
                            .transition(.slide)
                            .animation(.easeInOut(duration: 2), value: viewmodel.isShowingSideMenu)
                        }
                    }
                }
                .sheet(item: $viewmodel.sheetType, content: {sheet in
                    switch sheet{
                        case .first:
                            FirstSheet(viewmodel: $viewmodel)
                                .presentationDetents([.medium])
                        case .second:
                            SecondSheet(viewmodel: $viewmodel)
                        case .third:
                            ThirdSheet()
                                .presentationDetents([.medium])
                    }
                })
            }
            
        }
    }
    
}

#Preview {
    ContentView()
}
