//
//  CreaterView.swift
//  IncognitoTest
//
//  Created by Shomil Singh on 29/08/24.
//

import SwiftUI

struct CreatorView: View {
    var body: some View {
        VStack(alignment:.leading){
            Text("Creator")
            Image("Image14")
                .resizable()
                .frame(width: 100 , height: 100)
                .clipShape(Circle())
                .scaledToFit()
            
        }
    }
}

#Preview {
    CreatorView()
}
