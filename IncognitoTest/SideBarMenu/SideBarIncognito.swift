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
                .frame(width: 45,height: 45)
                .padding(.horizontal)
            Text("Incognito")
                .font(.title2)
                .fontWeight(.semibold)
        }
        .onTapGesture {
            viewmodel.isShowingSideMenu = false
            viewmodel.selectedMenu = .incognito
            viewmodel.sheetType = .first
        }
    }
}

#Preview {
    SideBarIncognito(viewmodel: ViewModel())
}
