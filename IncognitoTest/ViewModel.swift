//
//  ModelView.swift
//  IncognitoTest
//
//  Created by Shomil Singh on 07/08/24.
//

import Foundation
import Firebase
import Combine

enum feedType : String , Identifiable{
    var id: String {rawValue}
    case main
    case trending
    case explore
}
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
class ViewModel : Hashable , Identifiable {
    static func == (lhs: ViewModel, rhs: ViewModel) -> Bool {
        return lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
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
    var cooldownTime : TimeInterval = 0.0
    var selectedFeedType : feedType = .main
    var givenIncognitoTime = 90
    var isProfileViewTapped = false
    var dismissViews = false

}
struct BomberComment: Identifiable {
    let id: String
    let text: String
    var remainingTime: TimeInterval
}
