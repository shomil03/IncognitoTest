//
//  FormDetailView.swift
//  IncognitoTest
//
//  Created by Shomil Singh on 01/09/24.
//

import SwiftUI

struct FormDetailView: View {
//    @Binding var forms: [Forms]
    @Binding var form: Forms
    @Binding var formmodel : FormModel
    @State private var isPresentingNewQuestion = false
    @Environment(\.dismiss) var dismiss
    var body: some View {
        
        NavigationStack {
            Form{
                Section(header: Text("Form Details")) {
                    TextField("Title", text: $form.title)
                    TextField("Description", text: $form.description)
                }
                
                Section(header: Text("Questions")) {
                    ForEach(form.questions.indices, id: \.self) { index in
                        NavigationLink(destination: QuestionDetailView(question: $form.questions[index])) {
                            Text(form.questions[index].questionText)
                        }
                    }
                    Button(action: {
                        isPresentingNewQuestion = true
                    }) {
                        Text("Add Question")
                    }
                }
            }
            .toolbar{
                ToolbarItem(placement: .topBarTrailing, content: {
                    Button("Done"){
//                        formmodel.forms.append(form)
                        print("Done saving form")
                        formmodel.isPresentingNewForm = false
                    }
                })
            }
        }
            .navigationTitle("Edit Form")
            .sheet(isPresented: $isPresentingNewQuestion) {
                QuestionDetailView(question: .constant(Question( questionText: "", type: .shortAnswer, options: [])))
        }
           
    }
}

#Preview {
    FormDetailView(form: .constant(Forms(title: "title", description: "description", questions: [])), formmodel: .constant(FormModel()))
}
