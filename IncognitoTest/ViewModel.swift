//
//  ModelView.swift
//  IncognitoTest
//
//  Created by Shomil Singh on 07/08/24.
//

import Foundation
import Firebase
import Combine

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

enum IncognitoModeTypes : String , Identifiable{
    var id : String{rawValue}
    case normal
    case bomber
//    case none
}
@Observable
class ViewModel {
    var opacity = 0.1
    var viewDisabled = false
    var isShowingSideMenu = false{
        didSet{
            viewDisabled.toggle()
            opacity = opacity == 0.1 ? 0.5 : 0.1
        }
    }
    var selectedMenu : MenuTypes = .none
    var selectedIncognitoType : IncognitoModeTypes = .bomber
    var sheetType : SheetTypes?
    var startTimer = false
    var timer: Timer = Timer()
    var cooldownTime = 0


}
