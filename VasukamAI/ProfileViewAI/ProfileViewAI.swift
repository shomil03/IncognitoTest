//
//  ProfileViewAI.swift
//  IncognitoTest
//
//  Created by Shomil Singh on 28/08/24.
//

import SwiftUI

struct ProfileViewAI: View {
    var color1 = Color(red: 234/255, green: 148/255, blue: 232/255)
    var color2 = Color(red: 131/255, green: 175/255, blue: 235/255)
    var images = ["Image5" , "Image6" , "Image7" , "Image8" , "Image9" , "Image10" , "Image11" , "Image12" , "Image13"]
    var body: some View {
        ZStack {
            Color(.black)
                .ignoresSafeArea()
            VStack{
                HStack(spacing:0) {
                    Image(systemName: "magnifyingglass")
                        .font(.title)
                        .overlay{
                            LinearGradient(colors: [color1 , color2], startPoint: .top, endPoint: .bottom)
                                .mask{
                                    Image(systemName: "magnifyingglass")
                                        .font(.title)
                                }
                        }
                    TitleView(string: "Create")
                    TitleView(string: "AI")
                        .bold()
                }
                ProfileDetailView()
                AIProfileFeedType()
                
                ScrollView(.vertical){
                    HStack(alignment : .top){
                        VStack{
                            ForEach(images , id: \.self){image in
                                Image(image)
                                    .resizable()
                                    .scaledToFill()
                                    .frame(minWidth: 0 , maxWidth: .infinity)
                                    .frame(height: CGFloat.random(in: 140...400))
                                    .clipShape(RoundedRectangle(cornerRadius: 10))
                            }
                        }
                        VStack{
                            ForEach(images , id: \.self){image in
                                Image(image)
                                    .resizable()
                                    .scaledToFill()
                                    .frame(minWidth: 0 , maxWidth: .infinity)
                                    .frame(height: CGFloat.random(in: 140...400))
                                    .clipShape(RoundedRectangle(cornerRadius: 10))
                            }
                        }

                    }
                }
            }
            .padding()
        }
    }
}

#Preview {
    ProfileViewAI()
}
