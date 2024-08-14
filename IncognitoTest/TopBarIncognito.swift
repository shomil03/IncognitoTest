//
//  TopBarIncognito.swift
//  IncognitoTest
//
//  Created by Shomil Singh on 14/08/24.
//

import SwiftUI

struct TopBarIncognito: View {
    var time : Int
    var body: some View {
        HStack{
            Spacer()
            Text("\(time)")
                .padding()
        }
    }
}

#Preview {
    TopBarIncognito(time: 5)
}
