//
//  ThirdSheet.swift
//  IncognitoTest
//
//  Created by Shomil Singh on 07/08/24.
//

import SwiftUI

struct ThirdSheet: View {
    @Binding var user : User
    var body: some View {
        VStack{
            Text("DONE!")
                .font(.largeTitle)
                .fontWeight(.heavy)
                .padding()
            Text("Enjoy your incognito mode!")
            
        }
        .onAppear(){
//            task{
                 user.addUser()
                
            }
//            IncognitoView()
//        }
    }
}

#Preview {
    ThirdSheet(user : .constant(User()))
}
