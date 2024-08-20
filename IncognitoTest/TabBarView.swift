//
//  TabBarView.swift
//  IncognitoTest
//
//  Created by Shomil Singh on 18/08/24.
//

import SwiftUI

struct TabBarView: View {
    @State var viewmodel = ViewModel()
    @State var user = User()
    init() {
        UITabBar.appearance().backgroundColor = UIColor.black
//        UITabBar.appearance(). = UIColor.black
        UITabBar.appearance().barTintColor = UIColor.white
        
    }
    var body: some View {
        TabView{
            IncognitoView(viewmodel: $viewmodel, user: $user)
                .tabItem {
                    Label("" , systemImage: "house")
                        .labelsHidden()
                        .font(.title2)
                        .foregroundStyle(Color(.white))
                }
            ReelView()
                .tabItem{
                    Label("", systemImage: "play.display")
                        .labelsHidden()
//                        .font(.title2)
                        .foregroundStyle(Color(.white))
                }
            CreateNewReelView()
                .tabItem{
                    Image(systemName: "plus")
                        .font(.system(size: 55))
//                    Label("", systemImage: "plus")
//                        .font(.largeTitle)
//                        .labelsHidden()
                }
            ZapView()
                .tabItem{
                    Label("", systemImage: "bolt")
                        .labelsHidden()
                }
            StoreView()
                .tabItem{
                    Label("", systemImage: "storefront")
                        .labelsHidden()
                }
            
        }
        .tint(Color(.white))
    }
}

#Preview {
    TabBarView()
}
