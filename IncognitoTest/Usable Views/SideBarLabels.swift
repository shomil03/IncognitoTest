//
//  SideBarLabels.swift
//  IncognitoTest
//
//  Created by Shomil Singh on 20/08/24.
//

import SwiftUI

struct SideBarLabels: View {
    var image : String = ""
    var text : String = ""
    var body: some View {
        HStack{
            Image(systemName: image)
                .resizable()
                .scaledToFit()
                .frame(width: 23,height: 23)
                .padding(.horizontal)
            Text(text)
                .font(.headline)
                .fontWeight(.medium)
        }
    }
}

#Preview {
    SideBarLabels()
}
