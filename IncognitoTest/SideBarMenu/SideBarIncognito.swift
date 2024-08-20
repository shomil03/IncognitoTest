//
//  SideBarIncognito.swift
//  IncognitoTest
//
//  Created by Shomil Singh on 07/08/24.
//

import SwiftUI

struct SideBarIncognito: View {
    var viewmodel : ViewModel
    var body: some View {
        HStack{
            Image(systemName: "eye.slash.circle.fill")
                .resizable()
                .frame(width: 30,height: 30)
                .padding(.horizontal)
            Text("Incognito")
                .font(.title3)
                .fontWeight(.medium)
        }
        .onTapGesture {
            viewmodel.isShowingSideMenu = false
            viewmodel.selectedMenu = .incognito
            viewmodel.sheetType = .first
            print("tapped incogito")
        }
    }
}

#Preview {
    SideBarIncognito(viewmodel: ViewModel())
}
