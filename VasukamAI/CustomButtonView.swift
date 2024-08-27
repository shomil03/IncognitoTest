//
//  CustomButtonView.swift
//  IncognitoTest
//
//  Created by Shomil Singh on 28/08/24.
//

import SwiftUI

struct CustomButtonView: View {
    var title : String = "Button"
    var foregroundColor : Color = Color(.white)
    var backgroundColor : Color = Color(.black)
    var body: some View {
        Text(title)
            .padding()
            .frame(maxWidth: .infinity)
            .foregroundStyle(foregroundColor)
            .background(backgroundColor)
            .clipShape(RoundedRectangle(cornerRadius: 25))
    }
}

#Preview {
    CustomButtonView()
}
