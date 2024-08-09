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
            .font(.callout)
            .fontWeight(.heavy)
//            .frame(maxwidth: , height: 60)
            .frame(maxWidth: .infinity , minHeight: 60)
            .background(Color.white)
            .clipShape(RoundedRectangle(cornerRadius: 50))
            .padding()
        
    }
}

#Preview {
    ButtonView()
}
