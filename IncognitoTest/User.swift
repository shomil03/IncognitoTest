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
    var currentSession : [String] = []
    var history : [String] = []
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
                "endTime" : Timestamp(date: endTime) ,
                "history" : history,
                "currentSession" : currentSession
            ],merge: true)
        }
        
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
    
    //    func saveComment(_ comment: String, incognitoMode: IncognitoModeTypes) {
    //        if incognitoMode == .bomber {
    //            currentSession.append(comment)
    //        } else {
    //            history.append(comment)
    //        }
    //        updateUserData()
    //    }
    func updateUserData() {
        do {
            db.collection("users").document("\(uuid)").updateData([
                "currentSession": currentSession,
                "history": history
            ])
        } catch let error {
            print("Error updating user data: \(error.localizedDescription)")
        }
    }
    func saveComment(_ comment: String, incognitoMode: IncognitoModeTypes) {
        if incognitoMode == .bomber {
            //            saveBomberComment(comment)
            saveCommentToCollection(comment, collectionName: "bomberComments")
            currentSession.append(comment)
        } else {
            saveCommentToCollection(comment, collectionName: "normalComments")
            history.append(comment)
        }
        updateUserData()
    }
    //    private func saveBomberComment(_ comment: String) {
    //        let documentRef = db.collection("bomberComments").addDocument(data: [
    //            "userId": uuid,
    //            "comment": comment,
    //            "timestamp": Timestamp(date: Date())
    //        ])
    ////        { error in
    ////            if let error = error {
    ////                print("Error saving bomber comment: \(error.localizedDescription)")
    ////            } else {
    ////                print("Bomber comment saved successfully.")
    ////                self.scheduleBomberCommentDeletion(documentRef: documentRef, delay: 30) // 30 seconds
    ////            }
    ////        }
    //    }
    private func saveCommentToCollection(_ comment: String, collectionName: String) {
        db.collection(collectionName).addDocument(data: [
            "userId": uuid.uuidString,
            "comment": comment,
            "timestamp": Timestamp(date: Date())
        ]) { error in
            if let error = error {
                print("Error saving comment to \(collectionName): \(error.localizedDescription)")
            } else {
                print("Comment saved to \(collectionName) successfully.")
            }
        }
    }
    private func scheduleBomberCommentDeletion(documentRef: DocumentReference, delay: TimeInterval) {
        DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
            documentRef.delete { error in
                if let error = error {
                    print("Error deleting bomber comment: \(error.localizedDescription)")
                } else {
                    print("Bomber comment deleted successfully.")
                }
            }
        }
    }
    func fetchNormalComments(completion : @escaping ([String]) -> Void) {
        db.collection("normalComments").getDocuments {snapshot , error in
            if let error = error {
                print("Error in fetching normal comments : \(error.localizedDescription)")
                completion([])
            }else{
                guard let documents = snapshot?.documents else{
                    completion([])
                    return
                }
                var comments: [String] = []
                for document in documents {
                    let data = document.data()
                    guard let commentText = data["comment"] as? String else {continue}
                    comments.append(commentText)
                }
                completion(comments)
            }
        }
    }
    func fetchValidBomberComments(completion: @escaping ([String]) -> Void) {
//        let db = Firestore.firestore()
//        let currentTime = Date()
        
        db.collection("bomberComments").getDocuments { snapshot, error in
            if let error = error {
                print("Error fetching bomber comments: \(error.localizedDescription)")
                completion([])
            } else {
                guard let documents = snapshot?.documents else {
                    completion([])
                    return
                }
                
                var validComments: [String] = []
                for document in documents {
                    let data = document.data()
                    guard let timestamp = data["timestamp"] as? Timestamp,
                          let commentText = data["comment"] as? String else { continue }
                    
                    let commentTime = timestamp.dateValue()
                    let timeElapsed = self.currentTime.timeIntervalSince(commentTime)
                    
                    if timeElapsed <= 30 {
//                        let comment = BomberComment(id: document.documentID, text: commentText, timestamp: commentTime)
                        let comment = commentText
                        validComments.append(comment)
//                        self.scheduleBomberCommentDeletion(documentId: document.documentID, expirationDate: commentTime )
                    } else {
                        // Delete expired comment
                        document.reference.delete { error in
                            if let error = error {
                                print("Error deleting expired bomber comment: \(error.localizedDescription)")
                            } else {
                                print("Expired bomber comment deleted successfully.")
                            }
                        }
                    }
                }
                
                completion(validComments)
            }
        }
    }
    func scheduleBomberCommentDeletion(documentId: String, expirationDate: Date) {
        let timeInterval = expirationDate.timeIntervalSinceNow
        guard timeInterval > 0 else {
            // Already expired, delete immediately
            deleteBomberComment(documentId: documentId)
            return
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + timeInterval) { [weak self] in
            self?.deleteBomberComment(documentId: documentId)
        }
    }
    
    func deleteBomberComment(documentId: String) {
        db.collection("bomberComments").document(documentId).delete { error in
            if let error = error {
                print("Error deleting bomber comment: \(error.localizedDescription)")
            } else {
                print("Bomber comment \(documentId) deleted successfully.")
                // Remove from your comments list
            }
        }
    }

}
