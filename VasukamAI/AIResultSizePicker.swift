//
//  AIResultSizePicker.swift
//  IncognitoTest
//
//  Created by Shomil Singh on 28/08/24.
//

import SwiftUI

struct AIResultSizePicker: View {
    var array = ["1:1"  , "LANDSCAPE", "PORTRAIT" ]
    @State var currentSelection = "PORTRAIT"
    var body: some View {
        Menu(content: {
            ForEach(array , id: \.self, content: {string in
                Button(string){
                    currentSelection = string
                }
            })
        }, label: {
            HStack{
                Text(currentSelection)
                Image(systemName: "chevron.down")
            }
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color(.lightDark))
            .foregroundStyle(Color(.white))
            .clipShape(RoundedRectangle(cornerRadius: 15))
        })
    }
}

#Preview {
    AIResultSizePicker()
}
