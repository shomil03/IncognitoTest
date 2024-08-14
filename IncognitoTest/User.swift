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
    let uuid = UUID()
    var remainingTime = 5.0
    var startTime = Date()
    var endTime = Date()
    var currentTime = Date()
    var incognitoStarted = false{
        didSet{
            if incognitoStarted{
                addUser()
//                startPeriodicFetching(for: "\(uuid)")
            }
        }
    }
    
    func addUser(){
        print("User added")
        let startTime = Date()
        let endTime = startTime.addingTimeInterval(1 * 30)
        //        FirebaseApp.configure()
        do {
            db.collection("users").document("\(uuid)").setData([
                "startTime" : Timestamp(date: startTime),
                "endTime" : Timestamp(date: endTime)
            ],merge: true)
        }
//        catch{
//            print("Error while adding data")
//        }
        
    }
    
    func deleteUser() {
        db.collection("users").document("\(uuid)").delete { [self] error in
            if let error = error {
                print("Error deleting user: \(error.localizedDescription)")
            } else {
                print("User successfully deleted with ID: \(uuid)")
            }
        }
        incognitoStarted = false
    }
    
    func fetchTimes(for userId: String, completion: @escaping (Result<(startTime: Date, endTime: Date), Error>) -> Void) {
        let db = Firestore.firestore()
        let userDocument = db.collection("users").document(userId)
        
        userDocument.getDocument { document, error in
            if let error = error {
                completion(.failure(error))
            } else if let document = document, document.exists {
                guard let data = document.data(),
                      let startTimestamp = data["startTime"] as? Timestamp,
                      let endTimestamp = data["endTime"] as? Timestamp else {
                    completion(.failure(NSError(domain: "DataError", code: 0, userInfo: [NSLocalizedDescriptionKey: "Start or End timestamp not found"])))
                    return
                }
                let startTime = startTimestamp.dateValue()
                let endTime = endTimestamp.dateValue()
                completion(.success((startTime, endTime)))
            } else {
                completion(.failure(NSError(domain: "DocumentError", code: 0, userInfo: [NSLocalizedDescriptionKey: "Document does not exist"])))
            }
        }
    }

    
//    func fetchTimes(for userId: String) async throws -> (startTime: Date, endTime: Date) {
//        let db = Firestore.firestore()
//        let userDocument = db.collection("users").document(userId)
//        
//        return try await withCheckedThrowingContinuation { continuation in
//            userDocument.getDocument { document, error in
//                if let error = error {
//                    continuation.resume(throwing: error)
//                } else if let document = document, document.exists {
//                    guard let data = document.data(),
//                          let startTimestamp = data["startTime"] as? Timestamp,
//                          let endTimestamp = data["endTime"] as? Timestamp else {
//                        continuation.resume(throwing: NSError(domain: "DataError", code: 0, userInfo: [NSLocalizedDescriptionKey: "Start or End timestamp not found"]))
//                        return
//                    }
//                    continuation.resume(returning: (startTimestamp.dateValue(), endTimestamp.dateValue()))
//                } else {
//                    continuation.resume(throwing: NSError(domain: "DocumentError", code: 0, userInfo: [NSLocalizedDescriptionKey: "Document does not exist"]))
//                }
//            }
//        }
//    }
    
    func calculateTimeDifferences() ->  (TimeInterval){
        getCurrentServerDate{result in
            switch result {
                case .success(let success):
                    self.currentTime = success
                case .failure(_):
                    print("Error in failure")
            }
        }
//                print("Current server date: \(currentTime)")
                // Use the date as needed
//        (startTime,endTime) = fetchTimes(for: "\(uuid)", completion: )
        fetchTimes(for: "\(uuid)"){result in
            switch result {
                case .success(let success):
                    (self.startTime , self.endTime) = success
                case .failure(_):
                    print("Error in fetching data")
            }
        }
        print("remainingTime \(remainingTime) currentTime \(currentTime) endTime \(endTime)")
                remainingTime = endTime.timeIntervalSince(currentTime)
        
//        print(remainingTime)
        //        return (elapsedTime, remainingTime)
        return (remainingTime)
    }
//    func getCurrentServerDate() async throws -> Date {
//        let db = Firestore.firestore()
//        
//        // Create a temporary document reference
//        let tempDocRef = db.collection("temp").document()
//        
//        // Use async/await to set the server timestamp
//        try await tempDocRef.setData(["timestamp": FieldValue.serverTimestamp()])
//        
//        // Read the document to get the server timestamp
//        let document = try await tempDocRef.getDocument()
//        
//        guard let timestamp = document.data()?["timestamp"] as? Timestamp else {
//            throw NSError(domain: "TimestampError", code: 0, userInfo: [NSLocalizedDescriptionKey: "Failed to retrieve server timestamp"])
//        }
//        
//        // Clean up by deleting the temporary document
//        try await tempDocRef.delete()
//        
//        return timestamp.dateValue()
//    }
    
    func getCurrentServerDate(completion: @escaping (Result<Date, Error>) -> Void) {
        
        // Create a temporary document reference
        let tempDocRef = db.collection("temp").document()
        
        // Set the server timestamp using a completion handler
        tempDocRef.setData(["timestamp": FieldValue.serverTimestamp()]) { error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            // Read the document to get the server timestamp
            tempDocRef.getDocument { document, error in
                if let error = error {
                    completion(.failure(error))
                    return
                }
                
                guard let document = document, document.exists,
                      let timestamp = document.data()?["timestamp"] as? Timestamp else {
                    completion(.failure(NSError(domain: "TimestampError", code: 0, userInfo: [NSLocalizedDescriptionKey: "Failed to retrieve server timestamp"])))
                    return
                }
                
                // Clean up by deleting the temporary document
                tempDocRef.delete { error in
                    if let error = error {
                        print("Error deleting temporary document: \(error.localizedDescription)")
                    }
                }
                
                // Return the date value of the timestamp
                completion(.success(timestamp.dateValue()))
            }
        }
    }

}
