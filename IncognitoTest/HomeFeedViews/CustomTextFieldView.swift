//
//  CustomTextFieldView.swift
//  IncognitoTest
//
//  Created by Shomil Singh on 20/08/24.
//

import SwiftUI
import Combine

struct CustomTextFieldView: View {
    var lightDark = Color(red: 32/255, green: 32/255, blue: 32/255)
    @State var input: String = ""
    @Binding var user: User
    @Binding var viewmodel: ViewModel
    @State private var keyboardHeight: CGFloat = 0
    
    var body: some View {
        VStack {
            Spacer()
            HStack {
                ZStack {
                    Circle()
                        .frame(width: 40, height: 40)
                        .foregroundStyle(
                            RadialGradient(colors: [Color(lightDark), Color(.white)], center: .center, startRadius: -10, endRadius: 55)
                        )
                    Image("Memoji")
                        .resizable()
                        .frame(width: 25, height: 25)
                        .clipShape(Circle())
                }
                TextField("", text: $input)
                    .onSubmit {
                        user.saveComment(input, incognitoMode: viewmodel.selectedIncognitoType)
                        user.loadValidBomberComments()
                        input = ""
                    }
                    .foregroundStyle(Color(.white))
                Image(systemName: "photo")
                    .foregroundStyle(Color(.white))
                    .padding(.trailing)
                Image(systemName: "mic")
                    .foregroundStyle(Color(.white))
                    .padding(.trailing)
                Image(systemName: "paperplane")
                    .rotationEffect(Angle(degrees: 45))
                    .foregroundStyle(Color(.white))
                    .padding(.trailing)
            }
            .frame(height: 30)
            .padding()
            .background(Color(lightDark))
            .clipShape(RoundedRectangle(cornerRadius: 45))
            .padding(.horizontal)
            .padding(.bottom, keyboardHeight)
            .animation(.easeOut(duration: 0.16), value: keyboardHeight)
            .onAppear(perform: startObservingKeyboard)
            .onDisappear(perform: stopObservingKeyboard)
        }
    }
    
    private func startObservingKeyboard() {
        NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillShowNotification, object: nil, queue: .main) { notification in
            if let keyboardFrame = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect {
                keyboardHeight = keyboardFrame.height
            }
        }
        
        NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillHideNotification, object: nil, queue: .main) { _ in
            keyboardHeight = 0
        }
    }
    
    private func stopObservingKeyboard() {
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
}

#Preview {
    CustomTextFieldView(user: .constant(User()), viewmodel: .constant(ViewModel()))
}
