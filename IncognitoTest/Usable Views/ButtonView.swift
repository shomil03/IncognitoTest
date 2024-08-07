//
//  ButtonView.swift
//  IncognitoTest
//
//  Created by Shomil Singh on 07/08/24.
//

import SwiftUI

struct ButtonView: View {
    var text : String = "Button"
    var body: some View {
        Text(text)
            .font(.headline)
            .frame(width: 275 , height: 60)
            .background(Color.secondary)
            .clipShape(RoundedRectangle(cornerRadius: 20))
            .foregroundStyle(Color.primary)
        
    }
}

#Preview {
    ButtonView()
}
