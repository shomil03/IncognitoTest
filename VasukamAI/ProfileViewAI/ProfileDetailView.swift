//
//  ProfileDetailView.swift
//  IncognitoTest
//
//  Created by Shomil Singh on 28/08/24.
//

import SwiftUI

struct ProfileDetailView: View {
    var body: some View {
        HStack(){
            Image("Image1")
                .resizable()
                .clipShape(Circle())
                .scaledToFit()
                .frame(width: 62 , height: 62)
                .padding(.trailing)
            Spacer()
            VStack{
                Text("ArtWorks")
                Text("25")
                    .frame(height: 23)
                    .fontWeight(.semibold)
            }
            Spacer()
            VStack{
                Text("Likes")
                HStack{
                    ZStack{
                        Image("Image2")
                            .resizable()
                            .frame(width: 23 , height: 23)
                            .clipShape(Circle())
                        Image("Image3")
                            .resizable()
                            .frame(width: 23 , height: 23)
                            .clipShape(Circle())
                            .padding(.leading)
                        Image("Image4")
                            .resizable()
                            .frame(width: 23 , height: 23)
                            .clipShape(Circle())
                            .padding(.leading)
                            .padding(.leading)
                    }
                    Text("25k")
                        .fontWeight(.semibold)
                }
            }
            .padding(.trailing)
        }
        .foregroundStyle(Color(.white))
    }
}

#Preview {
    ProfileDetailView()
}
