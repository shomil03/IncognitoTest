//
//  FormModel.swift
//  IncognitoTest
//
//  Created by Shomil Singh on 01/09/24.
//

import Foundation
struct Forms {
    var title: String
    var description: String
    var questions: [Question]
    init(title: String, description: String, questions: [Question] = []) {
        self.title = title
        self.description = description
        self.questions = questions
    }
}

struct Question {
    var id : UUID
    var questionText: String
    var type: QuestionType
    var options: [String]
    
    // Sample initializer for Question struct
    init(questionText: String, type: QuestionType, options: [String] = []) {
        self.id = UUID()
        self.questionText = questionText
        self.type = type
        self.options = options
    }
}

enum QuestionType : String,Identifiable,CaseIterable {
    case shortAnswer
    case multipleChoice
    //    case checkbox
    //    case date
    var id : String { self.rawValue }
}
struct Response {
    var questionId: UUID
    var answer: String
}
@Observable
class FormModel{
    var forms : [Forms]
    init(){
        self.forms = []
    }
    var isPresentingNewForm = false
}
