//
//  BoxTextView.swift
//  IncognitoTest
//
//  Created by Shomil Singh on 07/08/24.
//

import SwiftUI

struct BoxTextView: View {
    var title : String = "Title"
    var paragraph : String = "some paragraph"
    var body: some View {
        VStack{
            Text(title)
                .font(.title2)
                .fontWeight(.medium)
                .padding(.bottom)
            Text(paragraph)
                .font(.footnote)
                .multilineTextAlignment(.leading)
        }
        .padding()
//        .frame(width: 300)
        .background(Color.blue)
        .clipShape(RoundedRectangle(cornerRadius: 20))
    }
}

#Preview {
    BoxTextView()
}
