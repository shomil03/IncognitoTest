//
//  SubtitleSelectors.swift
//  IncognitoTest
//
//  Created by Shomil Singh on 27/08/24.
//

import SwiftUI

struct SubtitleSelectors: View {
    var string : String = "string"
    var lightDark = Color(red: 32/255, green: 32/255, blue: 32/255)
    var body: some View {
        Text(string)
            .padding(.horizontal)
            .padding(.vertical , 7)
            .background(Color(lightDark))
            .clipShape(RoundedRectangle(cornerRadius: 20))
            .foregroundStyle(Color(.white))
    }
}

#Preview {
    SubtitleSelectors()
}
