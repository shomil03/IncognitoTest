//
//  QuestionDetailView.swift
//  IncognitoTest
//
//  Created by Shomil Singh on 01/09/24.
//

import SwiftUI

struct QuestionDetailView: View {
    @Binding var question: Question
    @State var questionType : QuestionType = .shortAnswer
    var body: some View {
        NavigationStack{
            Form{
                Section(header: Text("Question Details")) {
                    TextField("Question Text", text: $question.questionText)
                    
                    Picker("Type", selection: $question.type) {
                        Text("Short Answer").tag(QuestionType.shortAnswer)
                        Text("Multiple Choice").tag(QuestionType.multipleChoice)
//                        Text("Checkbox").tag(QuestionType.checkbox)
//                        Text("Date").tag(QuestionType.date)
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    
//                    if question.type == .multipleChoice || question.type == .checkbox {
//                        Section(header: Text("Options")) {
//                            ForEach(question.options.indices, id: \.self) { index in
//                                TextField("Option \(index + 1)", text: $question.options[index])
//                            }
//                            Button(action: {
//                                question.options.append("")
//                            }) {
//                                Text("Add Option")
//                            }
//                        }
//                    }
                }
                Text("selected Type \(question.type.rawValue)")
            }
        }
        .navigationTitle("Edit Question")
    }
}

#Preview {
    QuestionDetailView(question: .constant(Question( questionText: "what is your name", type: .shortAnswer, options: [])))
}
