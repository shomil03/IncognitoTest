//
//  ResultView.swift
//  IncognitoTest
//
//  Created by Shomil Singh on 28/08/24.
//

import SwiftUI

struct ResultView: View {
    var title : String = "Lamborghini Aventador Ultimae"
    var prompt : String = "Design the ultimate powered sports car, combining unrivaled speed, agility, and aerodynamics with advanced connectivity, safety, and futuristic design, revolutionizing the driving experience and setting new benchmarks in high-performance automotive engineering."
    var description : String = "Unleash the future of sports cars with our AI-powered masterpiece, combining unrivaled performance, sleek design, advanced connectivity, and cutting-edge safety for an unparalleled driving experience."
    var body: some View {
//        VStack{
            ZStack{
                
                GeometryReader{geo in
                    
                    Image("Image10")
                        .resizable()
                        .frame(maxWidth: .infinity)
                        .frame(height: geo.size.height/1.5)
                        .scaledToFit()
                        .ignoresSafeArea()
                    VStack{
                        RoundedRectangle(cornerRadius: 35.0)
                            .frame(maxWidth: .infinity)
                            .frame(height: 45)
                            .foregroundStyle(Color(.black))
                            .offset(y : -10)
//                            .padding(.bottom)
                        ScrollView(.vertical){
                            ResultTitleView()
                            Text(title)
                                .foregroundStyle(Color(.white))
                                .font(.title2)
                            VStack(alignment: .leading){
                                Text("prompt")
                                    .foregroundStyle(Color(.white).opacity(0.5))
                                Text(prompt)
                                    .foregroundStyle(Color.white)
                                Text("Description")
                                    .foregroundStyle(Color(.white).opacity(0.5))
                                Text(description)
                                    .foregroundStyle(Color(.white))
                                KeywordsView()
                                
                                CreatorView()
                                
                                CollaboratorView()
                            }
                        }
                        .padding()
                        .scrollIndicators(.hidden)
                        .offset(y : -25)
                    }
                    .frame(height: geo.size.height/2)
                    .background(Color(.black))
                    .offset(y : geo.size.height/2)
                
            }
            
        }
    }
}

#Preview {
    ResultView()
}
