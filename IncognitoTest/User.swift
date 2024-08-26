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
class User : Hashable , Identifiable{
//    struct BomberComment: Identifiable {
//        let id: String
//        let text: String
//        var remainingTime: TimeInterval
//    }
    static func == (lhs: User, rhs: User) -> Bool {
        return lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    let db = Firestore.firestore()
    let uuid = UUID()
    var remainingTime = 5.0
    var startTime = Date()
    var endTime = Date()
    var currentTime = Date()
    var currentSession : [String] = []
    var history : [String] = []
    var bomberComments : [BomberComment] = []
    var normalComments : [String] = []
    var bomberCommentTotalTime = 60
    var isLoading = false
    var incognitoStarted = false{
        didSet{
            if incognitoStarted{
                addUser()
                //                startPeriodicFetching(for: "\(uuid)")
            }
        }
    }
    
    func addUser(){
        isLoading = true
        print("User added")
        let startTime = Date()
        let endTime = startTime.addingTimeInterval(5 * 30)
        //        FirebaseApp.configure()
        do {
            db.collection("users").document("\(uuid)").setData([
                "startTime" : Timestamp(date: startTime),
                "endTime" : Timestamp(date: endTime) ,
                "history" : history,
                "currentSession" : currentSession
            ],merge: true)
        }
       isLoading = false
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
    
//    func fetchTimes(for userId: String, completion: @escaping (Result<(startTime: Date, endTime: Date), Error>) -> Void) {
//        let db = Firestore.firestore()
//        let userDocument = db.collection("users").document(userId)
//        
//        userDocument.getDocument { document, error in
//            if let error = error {
//                completion(.failure(error))
//            } else if let document = document, document.exists {
//                guard let data = document.data(),
//                      let startTimestamp = data["startTime"] as? Timestamp,
//                      let endTimestamp = data["endTime"] as? Timestamp else {
//                    completion(.failure(NSError(domain: "DataError", code: 0, userInfo: [NSLocalizedDescriptionKey: "Start or End timestamp not found"])))
//                    return
//                }
//                let startTime = startTimestamp.dateValue()
//                let endTime = endTimestamp.dateValue()
//                completion(.success((startTime, endTime)))
//            } else {
//                completion(.failure(NSError(domain: "DocumentError", code: 0, userInfo: [NSLocalizedDescriptionKey: "Document does not exist"])))
//            }
//        }
//    }
    
    func fetchTimes(for userId: String) async throws -> (startTime: Date, endTime: Date) {
        let db = Firestore.firestore()
        let userDocument = db.collection("users").document(userId)
        
        do {
            let document = try await userDocument.getDocument()
            guard let data = document.data(),
                  let startTimestamp = data["startTime"] as? Timestamp,
                  let endTimestamp = data["endTime"] as? Timestamp else {
                throw NSError(domain: "DataError", code: 0, userInfo: [NSLocalizedDescriptionKey: "Start or End timestamp not found"])
            }
            let startTime = startTimestamp.dateValue()
            let endTime = endTimestamp.dateValue()
            return (startTime, endTime)
        } catch {
            throw error
        }
    }

    
    func calculateTimeDifferences() async -> TimeInterval {
        do {
            isLoading = true
            let times = try await fetchTimes(for: "\(uuid)")
            (self.startTime, self.endTime) = times
            self.currentTime = try await getCurrentServerDate()
            
            remainingTime = endTime.timeIntervalSince(currentTime)
            print("Remaining Time: \(remainingTime), Current Time: \(currentTime), End Time: \(endTime)")
            isLoading = false
        } catch {
            print("Error in calculating time differences: \(error)")
            isLoading = false
            remainingTime = 0
        }
        
        return remainingTime
    }

//    func calculateTimeDifferences() ->  (TimeInterval){
////        getCurrentServerDate{result in
////            switch result {
////                case .success(let success):
////                    self.currentTime = success
////                case .failure(_):
////                    print("Error in failure")
////            }
////        }
////        fetchTimes(for: "\(uuid)"){result in
////            switch result {
////                case .success(let success):
////                    (self.startTime , self.endTime) = success
////                case .failure(_):
////                    print("Error in fetching data")
////            }
////        }
//        
//        Task {
//            isLoading = true
//            do {
//                let times = try await fetchTimes(for: "\(uuid)")
//                (self.startTime, self.endTime) = times
//            } catch {
//                print("Error in fetching data: \(error)")
//            }
//            do{
//                currentTime = try await getCurrentServerDate()
//                
//            }catch{
//                print("Error in fetching current time \(error)")
//            }
//            isLoading = false
//        }
//        
//
//        remainingTime = endTime.timeIntervalSince(currentTime)
//        print("remainingTime \(remainingTime) currentTime \(currentTime) endTime \(endTime)")
//        
//        //        print(remainingTime)
//        //        return (elapsedTime, remainingTime)
////        isLoading = false
//        return (remainingTime)
//    }
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
    
    func getCurrentServerDate() async throws -> Date {
        // Create a temporary document reference
        let tempDocRef = db.collection("temp").document()
        
        // Set the server timestamp
        try await tempDocRef.setData(["timestamp": FieldValue.serverTimestamp()])
        
        // Read the document to get the server timestamp
        let document = try await tempDocRef.getDocument()
        
        guard let timestamp = document.data()?["timestamp"] as? Timestamp else {
            throw NSError(domain: "TimestampError", code: 0, userInfo: [NSLocalizedDescriptionKey: "Failed to retrieve server timestamp"])
        }
        
        // Clean up by deleting the temporary document
        try await tempDocRef.delete()
        
        // Return the date value of the timestamp
        return timestamp.dateValue()
    }

    
//    func getCurrentServerDate(completion: @escaping (Result<Date, Error>) -> Void) {
//        
//        // Create a temporary document reference
//        let tempDocRef = db.collection("temp").document()
//        
//        // Set the server timestamp using a completion handler
//        tempDocRef.setData(["timestamp": FieldValue.serverTimestamp()]) { error in
//            if let error = error {
//                completion(.failure(error))
//                return
//            }
//            
//            // Read the document to get the server timestamp
//            tempDocRef.getDocument { document, error in
//                if let error = error {
//                    completion(.failure(error))
//                    return
//                }
//                
//                guard let document = document, document.exists,
//                      let timestamp = document.data()?["timestamp"] as? Timestamp else {
//                    completion(.failure(NSError(domain: "TimestampError", code: 0, userInfo: [NSLocalizedDescriptionKey: "Failed to retrieve server timestamp"])))
//                    return
//                }
//                
//                // Clean up by deleting the temporary document
//                tempDocRef.delete { error in
//                    if let error = error {
//                        print("Error deleting temporary document: \(error.localizedDescription)")
//                    }
//                }
//                
//                // Return the date value of the timestamp
//                completion(.success(timestamp.dateValue()))
//            }
//        }
//    }
    
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
        }
    }
    
    func saveComment(_ comment: String, incognitoMode: IncognitoModeTypes) {
        if incognitoMode == .bomber {
            let endTime = Date().addingTimeInterval(60) // Assuming 30 seconds expiration
            saveBomberComment(comment, endTime: endTime)
            currentSession.append(comment)
//            fetchValidBomberComments(completion: { _ in
//                // Handle valid bomber comments
//            })
        } else {
            saveCommentToCollection(comment, collectionName: "normalComments")
            history.append(comment)
            Task{
                do{
                    bomberComments = await fetchValidBomberComments()
                    normalComments = await fetchNormalComments()
                }
            }
//            fetchNormalComments(completion: { _ in
//                // Handle normal comments
//            })
        }
        updateUserData()
    }
    
    private func saveBomberComment(_ comment: String, endTime: Date) {
        let endTimeTimestamp = Timestamp(date: endTime)
        saveCommentToCollection(comment, collectionName: "bomberComments", additionalData: ["endTime": endTimeTimestamp])
    }
    
    private func saveCommentToCollection(_ comment: String, collectionName: String, additionalData: [String: Any] = [:]) {
        var data: [String: Any] = [
            "userId": uuid.uuidString,
            "comment": comment,
            "timestamp": Timestamp(date: Date())
        ]
        
        // Add additional data (like endTime) if provided
        for (key, value) in additionalData {
            data[key] = value
        }
        
        db.collection(collectionName).addDocument(data: data) { error in
            if let error = error {
                print("Error saving comment to \(collectionName): \(error.localizedDescription)")
            } else {
                print("Comment saved to \(collectionName) successfully.")
            }
        }
    }
    
//    func saveComment(_ comment: String, incognitoMode: IncognitoModeTypes) {
//        if incognitoMode == .bomber {
//            //            saveBomberComment(comment)
//            saveCommentToCollection(comment, collectionName: "bomberComments")
//            currentSession.append(comment)
//            fetchValidBomberComments(completion: {comment in
//                
//            })
//        } else {
//            saveCommentToCollection(comment, collectionName: "normalComments")
//            history.append(comment)
//            fetchNormalComments(completion: {comment in
//            })
//        }
//        updateUserData()
//    }
    
//    private func saveCommentToCollection(_ comment: String, collectionName: String) {
//        db.collection(collectionName).addDocument(data: [
//            "userId": uuid.uuidString,
//            "comment": comment,
//            "timestamp": Timestamp(date: Date())
//        ]) { error in
//            if let error = error {
//                print("Error saving comment to \(collectionName): \(error.localizedDescription)")
//            } else {
//                print("Comment saved to \(collectionName) successfully.")
//            }
//        }
//    }
    
    private func scheduleBomberCommentDeletion(documentRef: DocumentReference, delay: TimeInterval) {
        Task {
            try await Task.sleep(nanoseconds: UInt64(delay * 1_000_000_000))
            try await documentRef.delete()
            print("Bomber comment deleted successfully.")
        }
    }

    
//    private func scheduleBomberCommentDeletion(documentRef: DocumentReference, delay: TimeInterval) {
//        print("starting automatic deletion of bomber comment")
//        DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
//            documentRef.delete { error in
//                if let error = error {
//                    print("Error deleting bomber comment: \(error.localizedDescription)")
//                } else {
//                    
//                    print("Bomber comment deleted successfully.")
//                    print("automatic deletion successfull")
//                    Task{
//                        await self.fetchValidBomberComments()
//                    }
////                    self.fetchValidBomberComments(completion: {comment in
////                    })
//                }
//            }
//            
//        }
//    }
    
//    func fetchNormalComments(completion : @escaping ([String]) -> Void) {
//        normalComments = []
//        db.collection("normalComments").getDocuments {snapshot , error in
//            if let error = error {
//                print("Error in fetching normal comments : \(error.localizedDescription)")
//                completion([])
//            }else{
//                guard let documents = snapshot?.documents else{
//                    completion([])
//                    return
//                }
//                let comments: [String] = []
//                for document in documents {
//                    let data = document.data()
//                    guard let commentText = data["comment"] as? String else {continue}
////                    comments.append(commentText)
//                    self.normalComments.append(commentText)
//                }
//                completion(comments)
//            }
//        }
//    }

    func fetchNormalComments() async -> [String] {
        do {
            let snapshot = try await db.collection("normalComments").getDocuments()
            let comments = snapshot.documents.compactMap { document in
                return document.data()["comment"] as? String
            }
            return comments
        } catch {
            print("Error in fetching normal comments: \(error.localizedDescription)")
            return []
        }
    }

    func fetchValidBomberComments() async -> [BomberComment] {
        print("starting")
        do {
            
            bomberComments = []
            let documents = try await db.collection("bomberComments").getDocuments().documents
            let currentTime = try await getCurrentServerDate()
            
            var validComments: [BomberComment] = []
            for document in documents {
                let data = document.data()
                guard let endTime = data["endTime"] as? Timestamp,
                      let commentText = data["comment"] as? String else { continue }
                
                let endTimeDate = endTime.dateValue()
                let remainingTime = endTimeDate.timeIntervalSince(currentTime) // Calculate remaining time based on endTime
                
                if remainingTime > 0 {
                    let comment = BomberComment(id: document.documentID, text: commentText, remainingTime: remainingTime)
                    validComments.append(comment)
                    scheduleBomberCommentDeletion(documentId: document.documentID, expirationDate: endTimeDate)
                } else {
                    // Delete expired comment
                    try await document.reference.delete()
                    print("Expired bomber comment deleted successfully.")
                }
            }
            
            self.bomberComments = validComments
            print("Bomber comments = \(bomberComments)")
            return validComments
            
        } catch {
            print("Error fetching bomber comments: \(error.localizedDescription)")
            return []
        }
    }

    
//    func fetchValidBomberComments(completion: @escaping ([BomberComment]) -> Void) {
//        bomberComments = []
//        db.collection("bomberComments").getDocuments { snapshot, error in
//            if let error = error {
//                print("Error fetching bomber comments: \(error.localizedDescription)")
//                completion([])
//            } else {
//                guard let documents = snapshot?.documents else {
//                    completion([])
//                    return
//                }
//                
//                self.getCurrentServerDate{result in
//                    switch result {
//                        case .success(let success):
//                            self.currentTime = success
//                        case .failure(_):
//                            print("Error in failure")
//                    }
//                }
//                var validComments: [BomberComment] = []
//                for document in documents {
//                    let data = document.data()
//                    guard let endTime = data["endTime"] as? Timestamp,
//                          let commentText = data["comment"] as? String else { continue }
//                    
//                    let endTimeDate = endTime.dateValue()
//                    let remainingTime = endTimeDate.timeIntervalSince(self.currentTime) // Calculate remaining time based on endTime
//                    print("remaining Time after fetching \(remainingTime) elapsedTime \(endTimeDate)")
//                    print("endTimeDate = \(endTimeDate) currentTime = \(self.currentTime)")
//                    if remainingTime > 0 {
//                        let comment = BomberComment(id: document.documentID, text: commentText, remainingTime: remainingTime)
//                        validComments.append(comment)
//                        self.scheduleBomberCommentDeletion(documentId: document.documentID, expirationDate: endTimeDate)
//                    } else {
//                        // Delete expired comment
//                        document.reference.delete { error in
//                            if let error = error {
//                                print("Error deleting expired bomber comment: \(error.localizedDescription)")
//                            } else {
//                                print("Expired bomber comment deleted successfully.")
//                            }
//                        }
//                    }
//                }
//                
//                self.bomberComments = validComments // Assign valid BomberComment objects to bomberComments
//                completion(validComments)
//            }
//        }
//    }

    
//    func fetchValidBomberComments(completion: @escaping ([BomberComment]) -> Void) {
//        bomberComments = []
//        db.collection("bomberComments").getDocuments { snapshot, error in
//            if let error = error {
//                print("Error fetching bomber comments: \(error.localizedDescription)")
//                completion([])
//            } else {
//                guard let documents = snapshot?.documents else {
//                    completion([])
//                    return
//                }
//                
//                var validComments: [BomberComment] = []
//                for document in documents {
//                    let data = document.data()
//                    guard let timestamp = data["timestamp"] as? Timestamp,
//                          let commentText = data["comment"] as? String else { continue }
//                    
//                    let commentTime = timestamp.dateValue()
//                    let timeElapsed = self.currentTime.timeIntervalSince(commentTime)
//                    let remainingTime = 60 - timeElapsed // Calculate remaining time (assuming 30 seconds lifespan)
//                    print("remaining Time after fetching \(remainingTime) elapsedTime \(timeElapsed)")
//                    if remainingTime > 0 {
//                        let comment = BomberComment(id: document.documentID, text: commentText, remainingTime: remainingTime)
//                        validComments.append(comment)
//                        self.scheduleBomberCommentDeletion(documentId: document.documentID, expirationDate: commentTime.addingTimeInterval(60))
//                    } else {
//                        document.reference.delete { error in
//                            if let error = error {
//                                print("Error deleting expired bomber comment: \(error.localizedDescription)")
//                            } else {
//                                print("Expired bomber comment deleted successfully.")
//                            }
//                        }
//                    }
//                }
//                
//                self.bomberComments = validComments // Assign valid BomberComment objects to bomberComments
//                completion(validComments)
//            }
//        }
//    }

    func loadValidBomberComments() {
        print("in loadValidBomberComments")
        Task{
            await fetchValidBomberComments()
        }
//        fetchValidBomberComments { comments in
//            DispatchQueue.main.async {
//                self.bomberComments = comments
//            }
//        }
    }

//    func fetchValidBomberComments(completion: @escaping ([String]) -> Void) {
//        print("called fetch bomber Comments")
//        bomberComments = []
//        db.collection("bomberComments").getDocuments { snapshot, error in
//            if let error = error {
//                print("Error fetching bomber comments: \(error.localizedDescription)")
//                completion([])
//            } else {
//                guard let documents = snapshot?.documents else {
//                    completion([])
//                    return
//                }
//                
//                
//                for document in documents {
//                    let data = document.data()
//                    guard let timestamp = data["timestamp"] as? Timestamp,
//                          let commentText = data["comment"] as? String else { continue }
//                    
//                    let commentTime = timestamp.dateValue()
//                    let timeElapsed = self.currentTime.timeIntervalSince(commentTime)
//                    
//                    if timeElapsed <= 30 {
////                        let comment = BomberComment(id: document.documentID, text: commentText, timestamp: commentTime)
//                        let comment = commentText
////                        validComments.append(comment)
//                        self.bomberComments.append(comment)
//                        self.scheduleBomberCommentDeletion(documentId: document.documentID, expirationDate: commentTime.addingTimeInterval(30) )
//                    } else {
//                        document.reference.delete { error in
//                            if let error = error {
//                                print("Error deleting expired bomber comment: \(error.localizedDescription)")
//                            } else {
//                                print("Expired bomber comment deleted successfully.")
//                            }
//                        }
//                    }
//                }
//                
//                completion([])
//            }
//        }
//    }
    
    func scheduleBomberCommentDeletion(documentId: String, expirationDate: Date) {
        let timeInterval = expirationDate.timeIntervalSinceNow
        guard timeInterval > 0 else {
            deleteBomberComment(documentId: documentId)
            return
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + timeInterval) { [weak self] in
            self?.deleteBomberComment(documentId: documentId)
        }
    }
    
    func deleteBomberComment(documentId: String) {
        db.collection("bomberComments").document(documentId).delete { [self] error in
            if let error = error {
                print("Error deleting bomber comment: \(error.localizedDescription)")
            } else {
                Task{
                    await fetchValidBomberComments()
                }
//                self.fetchValidBomberComments(completion: {comment in
//                })
                print("Bomber comment \(documentId) deleted successfully.")
                print(bomberComments)
            }
        }
    }

}
