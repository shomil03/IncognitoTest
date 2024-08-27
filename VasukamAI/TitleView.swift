//
//  TitleView.swift
//  IncognitoTest
//
//  Created by Shomil Singh on 27/08/24.
//

import SwiftUI

struct TitleView: View {
    var color1 = Color(red: 234/255, green: 148/255, blue: 232/255)
    var color2 = Color(red: 131/255, green: 175/255, blue: 235/255)
    var gradient = LinearGradient(colors: [Color.black], startPoint: .topLeading, endPoint: .bottomTrailing)
    var string : String = "CreateAI"
    var body: some View {
        Text(string)
            .font(.title)
//            .bold()
            .overlay{
                LinearGradient(colors: [color1 , color2], startPoint: .top, endPoint: .bottom)
                .mask{
                    Text(string)
                        .font(.title)
//                        .bold()
                }
            }
            
    }
}

#Preview {
    TitleView()
}
