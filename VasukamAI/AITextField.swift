//
//  AITextField.swift
//  IncognitoTest
//
//  Created by Shomil Singh on 27/08/24.
//

import SwiftUI

struct AITextField: View {
    var string : String = "prompt"
    @State var prompt : String = ""
    var lowerbound : Int = 3
    var upperboound : Int = 6
    var lightDark = Color(red: 32/255, green: 32/255, blue: 32/255)
    var subject : String = "/create"
    var body: some View {
        VStack(alignment:.leading){
            Text(string)
                .foregroundStyle(Color(.white))
            
            HStack(alignment: .top){
                Text(subject)
                TextField("" , text: $prompt , axis: .vertical)
                    .lineLimit(lowerbound ... upperboound)
                    
            }
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color(lightDark))
            .clipShape(RoundedRectangle(cornerRadius: 20))
            .foregroundStyle(Color(.white))
            
//            TextField("/create write here" , text: $prompt ,axis: .vertical)
//                .lineLimit(lowerbound ... upperboound)
//                .textFieldStyle(.roundedBorder)
//                .overlay(alignment : .topLeading){
//                    Text("/create")
//                        .padding(.leading,5)
//                        .padding(.top,5)
//                        .foregroundStyle(Color(.white))
//                }
//                .tint(.white)
                
        }
    }
}

#Preview {
    AITextField()
}
