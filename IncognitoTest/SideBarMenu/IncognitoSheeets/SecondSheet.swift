//
//  SecondSheet.swift
//  IncognitoTest
//
//  Created by Shomil Singh on 07/08/24.
//

import SwiftUI

struct SecondSheet: View {
    var bomberPara = "This will allow you to delete all the posts, comments & interactions done while you were in incognito mode"
    var normalPara = "This will allow you to keep all the posts, comments & interactions done while you were in incognito mode"
    var body: some View {
        VStack{
            Text("Select your mode")
                .font(.title)
                .fontWeight(.semibold)
            BoxTextView(title: "Bomber Mode", paragraph: bomberPara)
                .padding()
            BoxTextView(title: "Normal Mode", paragraph: normalPara)
            
            
            Rectangle()
                .frame(height: 1)
                .padding()
            
        }
    }
}

#Preview {
    SecondSheet()
}
