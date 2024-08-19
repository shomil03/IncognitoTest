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
    var body: some View {
        TabView{
            IncognitoView(viewmodel: $viewmodel, user: $user)
                .tabItem {
                    Label("" , systemImage: "house")
                        .labelsHidden()
                }
            ReelView()
                .tabItem{
                    Label("", systemImage: "play.display")
                        .labelsHidden()
                }
            CreateNewReelView()
                .tabItem{
                    Label("", systemImage: "plus")
                        .font(.largeTitle)
                        .labelsHidden()
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
