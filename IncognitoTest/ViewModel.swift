//
//  ModelView.swift
//  IncognitoTest
//
//  Created by Shomil Singh on 07/08/24.
//

import Foundation
enum MenuTypes : String , Identifiable{
    var id: String {rawValue}
    case none
    case incognito
}
enum SheetTypes : String , Identifiable{
    var id : String {rawValue}
    case first
    case second
    case third
}
@Observable
class ViewModel {
    var isShowingSideMenu = false
    var selectedMenu : MenuTypes = .none
    var sheetType : SheetTypes?
    var showingIncognitoSheet = false
    var isShowingSheet = false
}
