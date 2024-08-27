//
//  SecondSheet.swift
//  IncognitoTest
//
//  Created by Shomil Singh on 07/08/24.
//

import SwiftUI

struct SecondSheet: View {
    @Binding var viewmodel : ViewModel
    var bomberPara = "This will allow you to delete all the posts, comments & interactions done while you were in incognito mode."
    var normalPara = "This will allow you to keep all the posts, comments & interactions done while you were in incognito mode."
    var lightDark = Color(red: 32/255, green: 32/255, blue: 32/255)
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            VStack{
                Spacer()
                Text("Select your mode")
                    .font(.title)
                    .foregroundStyle(Color.white)
                    .fontWeight(.bold)
                BoxTextView(title: "Bomber Mode", paragraph: bomberPara , background: viewmodel.selectedIncognitoType.rawValue == "bomber" ? Color.blue : lightDark)
                    .padding()
                    .onTapGesture {
                        withAnimation(){
                            viewmodel.selectedIncognitoType = .bomber
                        }
                    }
                BoxTextView(title: "Normal Mode", paragraph: normalPara , background: viewmodel.selectedIncognitoType.rawValue == "normal" ? Color.blue : lightDark)
                    .padding()
                    .onTapGesture {
                        withAnimation(){
                            viewmodel.selectedIncognitoType = .normal
                        }
                    }
                
                
                Rectangle()
                    .frame(height: 1)
                    .padding()
                    .foregroundStyle(Color.gray)
                
                TimeSpanView()
                    .padding(.horizontal)
//                    .padding(.vertical)
                    .foregroundStyle(Color.white)
                
                Button(action: {
                    viewmodel.sheetType = .third
                    
                }, label: {
                    ButtonView(text: "DONE")
                        .foregroundStyle(Color.black)
                })
                .padding(.top)
                .padding(.bottom)
            }
        }
        
    }
}
struct TimeSpanView : View {
    var body: some View {
        HStack{
            Text("Initial Timespan")
            Spacer()
            Text("5 Mins")
        }
        .padding()
    }
}
#Preview {
    SecondSheet(viewmodel: .constant(ViewModel()))
}
