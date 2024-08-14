//
//  ThirdSheet.swift
//  IncognitoTest
//
//  Created by Shomil Singh on 07/08/24.
//

import SwiftUI

struct ThirdSheet: View {
    @Binding var user : User
    @Binding var viewmodel : ViewModel
    var body: some View {
        VStack{
            Text("DONE!")
                .font(.largeTitle)
                .fontWeight(.heavy)
                .padding()
            Text("Enjoy your incognito mode!")
            
        }
        .onTapGesture{
            user.incognitoStarted = true
            viewmodel.startTimer = true
        }
    }
}

#Preview {
    ThirdSheet(user : .constant(User()) , viewmodel: .constant(ViewModel()))
}
