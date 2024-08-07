//
//  FirstSheet.swift
//  IncognitoTest
//
//  Created by Shomil Singh on 07/08/24.
//

import SwiftUI

struct FirstSheet: View {
    @Binding var viewmodel : ViewModel
//    var modelView = ModelView
    var about = "This is an ability in which you can be anonymous and use the application, you can post, comment and interact with the user."
    var warning = "YOU SHOULD NOT USE THESE FEATURE FOR ANY WRONG MEANS."
    var body: some View {
        VStack{
            Text("Incognito Mode")
                .font(.title)
                .fontWeight(.bold)
                .padding(.bottom)
            Text(about)
                .multilineTextAlignment(.center)
                .padding(.bottom)
            Text(warning)
                .fontWeight(.semibold)
                .foregroundStyle(Color.red)
                .multilineTextAlignment(.center)
                .padding(.bottom)
            
            Button(action: {
                viewmodel.sheetType = .second
            }, label: {
                ButtonView(text: "GET IT!")
            })
            .padding()
            
        }
    }
}

#Preview {
    FirstSheet(viewmodel: .constant(ViewModel()))
}
