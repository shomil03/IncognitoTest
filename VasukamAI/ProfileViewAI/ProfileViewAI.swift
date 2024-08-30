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
    var imageArray = ["Image5" , "Image6" , "Image7" , "Image8" , "Image9" , "Image10" , "Image11" , "Image12" , "Image13"]
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
                    LazyVGrid(columns: [GridItem(.flexible()),
                                        GridItem(.flexible()),
                                        GridItem(.flexible())]){
                        ForEach(imageArray , id: \.self){imageName in
                            Image(imageName)
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .clipped()
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
