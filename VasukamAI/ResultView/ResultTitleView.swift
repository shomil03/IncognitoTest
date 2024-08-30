//
//  ResultTitleView.swift
//  IncognitoTest
//
//  Created by Shomil Singh on 28/08/24.
//

import SwiftUI

struct ResultTitleView: View {
    var title : String = "title"
    var body: some View {
        VStack{
            HStack{
                Text("title")
                Spacer()
                Image(systemName: "doc.on.doc")
            }
            .foregroundStyle(Color(.white).opacity(0.5))
            Text(title)
        }
    }
}

#Preview {
    ResultTitleView()
}
