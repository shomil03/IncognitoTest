//
//  AISearchView.swift
//  IncognitoTest
//
//  Created by Shomil Singh on 27/08/24.
//

import SwiftUI

struct AISearchView: View {
    var array = ["A Futuristic Cyberpunk" , "Humanoid Pirated" , "Fluffy Forest"]
    var body: some View {
        ZStack{
            Color(.black)
                .ignoresSafeArea()
            VStack(alignment: .leading){
                HStack(spacing : 0){
                    Spacer()
                    TitleView(string: "Create")
                    TitleView(string: "AI")
                        .bold()
                    Spacer()
                }
                ScrollView{
                    AITextField(string: "prompt", lowerbound: 9, upperboound: 12)
                        .padding(.bottom)
                    AITextField(string: "GIVE IT A FEEL", prompt: "", lowerbound: 3, upperboound: 6 , subject: "/style")
                    ScrollView(.horizontal){
                        HStack{
                            ForEach(array , id: \.self){text in
                                SubtitleSelectors(string: text)
                            }
                        }
                    }
                    .scrollIndicators(.hidden)
                    .padding(.bottom)
                    
                    AITextField(string: "SUBJECT", lowerbound: 3, upperboound: 6, subject: "/sub")
                    ScrollView(.horizontal){
                        HStack{
                            ForEach(array , id: \.self){text in
                                SubtitleSelectors(string: text)
                            }
                        }
                    }
                    .scrollIndicators(.hidden)
                    .padding(.bottom)
                    ArtBoardView()
                        .padding(.bottom)
                    
                    AIResultSizePicker()
                        .padding(.bottom)
                    
                    Button(action: {}, label: {
                        CustomButtonView(title: "Generate", foregroundColor: Color(.black), backgroundColor: Color(.acidGreen))
                    })
                    .padding(.vertical)
                    
                    
                    
                }
                .padding()
                .scrollIndicators(.hidden)
                
            }
        }
    }
}

#Preview {
    AISearchView()
}
