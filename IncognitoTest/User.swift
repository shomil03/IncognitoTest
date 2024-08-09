//
//  User.swift
//  IncognitoTest
//
//  Created by Shomil Singh on 09/08/24.
//

import Foundation
import FirebaseCore
import FirebaseFirestore
import SwiftUI

@Observable
class User{
    let db = Firestore.firestore()
    func addUser(){
//        FirebaseApp.configure()
        do {
            _ = try db.collection("users").document("\(UUID())").setData([
                "timestamp" : Timestamp(date: Date())
            ],merge: true)
        }catch{
            print("Error while adding data")
        }
        
    }
}
