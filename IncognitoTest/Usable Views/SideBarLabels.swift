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
                .frame(width: 30,height: 30)
                .padding(.horizontal)
            Text(text)
                .font(.title3)
                .fontWeight(.medium)
        }
    }
}

#Preview {
    SideBarLabels()
}
