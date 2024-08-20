//
//  DiscussionView.swift
//  IncognitoTest
//
//  Created by Shomil Singh on 19/08/24.
//

import SwiftUI

struct DiscussionView: View {
    
    var body: some View {
        NavigationStack{
            VStack(spacing: 0){
                ScrollView{
                    LazyVStack(alignment: .leading){
                        ForEach(0..<5 , id: \.self){_ in
                            DiscussionCommentView()
                        }
                    }
                }
                CustomTextFieldView()
                    
            }
            .ignoresSafeArea(edges : .bottom)
            
        }
    }
}

#Preview {
    DiscussionView()
}
