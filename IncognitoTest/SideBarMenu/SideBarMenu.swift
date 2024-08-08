//
//  SideBarMenu.swift
//  IncognitoTest
//
//  Created by Shomil Singh on 07/08/24.
//

import SwiftUI

struct SideBarMenu: View {
    var viewmodel : ViewModel
    var body: some View {
        ZStack{
            HStack{
                VStack(alignment: .leading){
                    VStack(){
                        SideBarProfile()
                            .foregroundStyle(Color.white)
                    }
                    .padding()
                    
                    VStack{
                        SideBarIncognito(viewmodel: viewmodel)
                            .foregroundStyle(Color.white)
                    }
                    .padding(10)
                    Spacer()
                }
                .frame(width: 270)
                .background(Color.black)
                Spacer()
                
            }
        }
    }
}

#Preview {
    SideBarMenu(viewmodel: ViewModel())
}
