//
//  SideBarMenu.swift
//  IncognitoTest
//
//  Created by Shomil Singh on 07/08/24.
//

import SwiftUI

struct SideBarMenu: View {
    var viewmodel : ViewModel
    @State var count = 0
    var body: some View {
        
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
//                    Button("Tap me \(count)"){
//                        count+=1
//                    }
                }
                .frame(width: 270)
                .background(Color.black)
                Spacer()
                
            }
        
    }
}

#Preview {
    SideBarMenu(viewmodel: ViewModel())
}
