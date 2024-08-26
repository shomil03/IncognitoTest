//
//  SideBarMenu.swift
//  IncognitoTest
//
//  Created by Shomil Singh on 07/08/24.
//

import SwiftUI

struct SideBarMenu: View {
    @Binding var viewmodel : ViewModel
    @State var count = 0
    var body: some View {
        
            HStack{
                VStack(alignment: .leading){
                    VStack(){
                        SideBarProfile(viewmodel: $viewmodel)
                            .foregroundStyle(Color.white)
                    }
                    .padding()
                    .padding(.bottom)
//                    VStack{
                        
//                            .foregroundStyle(Color.white)
//                    }
                    VStack(alignment: .leading,spacing: 25){SideBarIncognito(viewmodel: viewmodel)
                        SideBarLabels(image: "rotate.3d.fill" , text: "Abilities")
                        SideBarLabels(image: "chart.xyaxis.line", text: "Analytics")
                        SideBarLabels(image: "stopwatch", text: "Your Activity")
                        SideBarLabels(image: "bookmark", text: "Saved Posts")
                        SideBarLabels(image: "person.3.fill", text: "Your groups")
                        SideBarLabels(image: "face.smiling", text: "Close friend list")
                        SideBarLabels(image: "message", text: "Questionnaire")
                        SideBarLabels(image: "storefront", text: "Your eshop")
                        SideBarLabels(image: "checkmark.seal", text: "Approvals")
                        SideBarLabels(image: "wallet.pass.fill", text: "Wallet")
                    }
                    .foregroundStyle(Color(.white))
                    .font(.subheadline)
                    .fontWeight(.medium)
//                    .padding(10)
                    Spacer()
//                    Button("Tap me \(count)"){
//                        count+=1
//                    }
                    VStack{
                        SideBarLabels(image: "gear", text: "Settings")
                    }
                    .padding(.trailing)
                }
                .frame(width: 270)
                .background(Color.black)
                Spacer()
                
            }
        
    }
}

#Preview {
    SideBarMenu(viewmodel: .constant(ViewModel()))
}
