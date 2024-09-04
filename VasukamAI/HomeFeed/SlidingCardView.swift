//
//  SlidingCardView.swift
//  IncognitoTest
//
//  Created by Shomil Singh on 30/08/24.
//

import SwiftUI

struct SlidingCardView: View {
    var images = ["Image17" , "Image17" , "Image17" , "Image17" , "Image17" , "Image17"]
    var body: some View {
        GeometryReader{geo in
            ScrollView(.horizontal){
                HStack{
                    ForEach(images , id: \.self){image in
                        Image(image)
                            .resizable()
                            .frame(width : geo.size.width ,height: 190)
                            .scaledToFit()
                    }
                }
            }
            .scrollIndicators(.hidden)
        }
    }
}

#Preview {
    SlidingCardView()
}
