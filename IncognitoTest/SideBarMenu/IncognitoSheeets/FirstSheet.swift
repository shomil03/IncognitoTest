//
//  FirstSheet.swift
//  IncognitoTest
//
//  Created by Shomil Singh on 07/08/24.
//

import SwiftUI

struct FirstSheet: View {
    @Binding var viewmodel : ViewModel
    var about = "This is an ability in which you can be anonymous and use the application, you can post, comment and interact with the users."
    var warning = "YOU SHOULD NOT USE THIS FEATURE FOR ANY WRONG MEANS."
    var body: some View {
        ZStack{
            Color.black.ignoresSafeArea()
            VStack{
                Spacer()
                Text("Incognito Mode")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundStyle(Color.white)
                Text(about)
                    .font(.callout)
                    .foregroundStyle(Color.white)
                    .multilineTextAlignment(.center)
                    .padding()
                Text(warning)
                    .font(.callout)
                    .fontWeight(.semibold)
                    .foregroundStyle(Color.red)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
                Button(action: {
                    viewmodel.sheetType = .second
                }, label: {
                    ButtonView(text: "GET IT!")
                        .foregroundStyle(Color.black)
                        
                })
                .padding()
            }
        }
    }
}

#Preview {
    FirstSheet(viewmodel: .constant(ViewModel()))
}
