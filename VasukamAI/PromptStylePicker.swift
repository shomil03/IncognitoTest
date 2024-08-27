//
//  PromptStylePicker.swift
//  IncognitoTest
//
//  Created by Shomil Singh on 27/08/24.
//

import SwiftUI

struct PromptStylePicker: View {
    @State var promptType : String = "Text"
    var body: some View {
        Menu(content: {
            Button("Text"){promptType = "Text"}
            Button("Image"){promptType = "Image"}
            Button("Video"){promptType = "Video"}
            Button("Music"){promptType = "Music"}
            Button("3D Model"){promptType = "3D Model"}
        }, label: {
            Text(promptType)
                .padding()
                .frame(width: 125)
                .foregroundStyle(Color(.white))
                .background(Color(.lightDark))
                .clipShape(RoundedRectangle(cornerRadius: 20))
            
        })
    }
}

#Preview {
    PromptStylePicker()
}
