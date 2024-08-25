//
//  CustomTextFieldView.swift
//  IncognitoTest
//
//  Created by Shomil Singh on 20/08/24.
//

import SwiftUI

struct CustomTextFieldView: View {
    var lightDark = Color(red: 32/255, green: 32/255, blue: 32/255)
    @State var input : String = ""
    @Binding var user : User
    @Binding var viewmodel : ViewModel
    var body: some View {
        HStack{
            ZStack{
                Circle()
                    .frame(width: 40, height: 40)
                    .foregroundStyle(
                        RadialGradient(colors: [Color(lightDark),Color(.white)], center: .center, startRadius: -10, endRadius: 55)
                    )
                Image("Memoji")
                    .resizable()
//                    .scaledToFit()
                    .frame(width: 25, height: 25)
                    .clipShape(Circle())
            }
            TextField("", text: $input)
                .onSubmit {
//                    user.saveComment(input , incognitoMode:viewmodel.selectedIncognitoType )
                    user.saveComment(input, incognitoMode: viewmodel.selectedIncognitoType)
                    input = ""
                }
                .foregroundStyle(Color(.white))
            Image(systemName: "photo")
                .foregroundStyle(Color(.white))
//                .resizable()
                .padding(.trailing)
            Image(systemName: "mic")
                .foregroundStyle(Color(.white))
                .padding(.trailing)
            Image(systemName: "paperplane")
                .rotationEffect(Angle(degrees: 45))
                .foregroundStyle(Color(.white))
                .padding(.trailing)
        }
        .frame( height: 30)
        .padding()
        .background(Color(lightDark))
        .clipShape(RoundedRectangle(cornerRadius: 45))
        .padding()
        
    }
}

#Preview {
    CustomTextFieldView(user: .constant(User()) , viewmodel: .constant(ViewModel()))
}
