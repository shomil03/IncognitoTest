//
//  IncognitoTestApp.swift
//  IncognitoTest
//
//  Created by Shomil Singh on 06/08/24.
//

import SwiftUI
import FirebaseCore

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        
        return true
    }
}

@main
struct IncognitoTestApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    var body: some Scene {
        @State var viewmodel = ViewModel()
        @State var user = User()
        WindowGroup {
//            ContentView()
            IncognitoView(viewmodel: $viewmodel, user: $user)
        }
    }
}
