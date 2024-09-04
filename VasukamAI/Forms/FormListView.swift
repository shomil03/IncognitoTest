//
//  FormListView.swift
//  IncognitoTest
//
//  Created by Shomil Singh on 01/09/24.
//

import SwiftUI

struct FormListView: View {
//    @State var forms: [Forms] = []
//    @State private var isPresentingNewForm = false
    @State var formmodel = FormModel()
    var body: some View {
        NavigationView {
            List {
                ForEach(formmodel.forms.indices , id: \.self){index in
                    NavigationLink(destination : FormDetailView(form: $formmodel.forms[index], formmodel: $formmodel)){
                        Text(formmodel.forms[index].title)
                    }
                }
                .onDelete{indexSet in
                    formmodel.forms.remove(atOffsets: indexSet)
                }
            }
            .navigationTitle("Forms")
            .navigationBarItems(trailing: Button(action: {
                let form = Forms(title: "", description: "", questions: [])
                addNewForm(form: form)
                formmodel.isPresentingNewForm = true
            }) {
                Image(systemName: "plus")
            })
            .sheet(isPresented: $formmodel.isPresentingNewForm) {
                
//                formmodel.forms.append(form)
//                addNewForm(form: form)
                if let lastForm = formmodel.forms.last {
                    FormDetailView( form: $formmodel.forms.last!, formmodel: $formmodel)
                }
            }
        }
    }
    func deleteForm(at offSets : IndexSet){
       
//            let form = formmodel.forms[offset]
            formmodel.forms.remove(atOffsets: offSets)
        
    }
    func addNewForm(form : Forms){
        formmodel.forms.append(form)
    }
}

#Preview {
    FormListView()
}
