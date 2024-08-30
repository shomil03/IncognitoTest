//
//  CollaboratorView.swift
//  IncognitoTest
//
//  Created by Shomil Singh on 29/08/24.
//

import SwiftUI

struct CollaboratorView: View {
    var images = ["Image15" , "Image16" ,"Image17" , "Image18"]
    var body: some View {
        VStack(alignment: .leading){
            Text("Collaborator")
                .foregroundStyle(Color(.white).opacity(0.5))
            
            ScrollView(.horizontal){
                HStack{
                    ForEach(images , id: \.self){image in
                        Image(image)
                            .resizable()
                            .frame(width: 100 , height: 100)
                            .clipShape(Circle())
                    }
                }
            }
            .scrollIndicators(.hidden)
        }
    }
}

#Preview {
    CollaboratorView()
}
