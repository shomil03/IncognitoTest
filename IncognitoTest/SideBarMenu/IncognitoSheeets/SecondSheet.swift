//
//  SecondSheet.swift
//  IncognitoTest
//
//  Created by Shomil Singh on 07/08/24.
//

import SwiftUI

struct SecondSheet: View {
    @Binding var viewmodel : ViewModel
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
                .padding()
            
            
            Rectangle()
                .frame(height: 1)
                .padding()
            
            TimeSpanView()
                .padding(.horizontal)
            
            Button(action: {
                viewmodel.sheetType = .third
            }, label: {
                ButtonView(text: "Done")
            })
            .padding(.top)
        }
        
    }
}
struct TimeSpanView : View {
    var body: some View {
        HStack{
            Text("Initial Timespan")
            Spacer()
            Text("5 mins")
        }
        .padding()
    }
}
#Preview {
    SecondSheet(viewmodel: .constant(ViewModel()))
}
