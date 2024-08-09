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
    var background : Color = Color.blue
    var body: some View {
        VStack(alignment: .leading,spacing: 10){
            Text(title)
                .font(.title2)
                .fontWeight(.semibold)
//                .padding(.bottom)
            Text(paragraph)
                .font(.footnote)
                .fontWeight(.medium)
                .multilineTextAlignment(.leading)
        }
        .padding()
        .frame(maxWidth: .infinity)
        
        .background(background)
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .padding(.horizontal)
    }
}

#Preview {
    BoxTextView()
}
