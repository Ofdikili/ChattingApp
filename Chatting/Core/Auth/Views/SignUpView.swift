//
//  LoginView.swift
//  Chatting
//
//  Created by Ömer Faruk Dikili on 25.02.2025.
//

import SwiftUI

struct SignUpView: View {
    @Environment(\.dismiss) private var dismiss
    @ObservedObject var authScreenModel : AuthScreenModel
    var body: some View {
        NavigationStack{
            VStack{
                Spacer()
                AuthHeaderView()
                AuthTextField(text:$authScreenModel.email,inputType: InputType.email)
                AuthTextField(text:$authScreenModel.username,inputType: InputType.custom(placeHolder: "Username", iconName: "at"))
                AuthTextField(text: $authScreenModel.password,inputType: InputType.password)
                AuthButton(title: "Create an Account", onTap: {
                    Task {
                        await authScreenModel.handleSignUp()
                    }
                })
                    .disabled(authScreenModel.disableSignUpButton)
                Spacer()
            }.frame(maxWidth: .infinity, maxHeight: .infinity)
                .background{
                    LinearGradient(colors: [.green,
                                            .green.opacity(0.8),.teal],
                                   startPoint: .top,
                                   endPoint: .bottom
                    )}
                .ignoresSafeArea(.all)
                .navigationBarBackButtonHidden()
                .safeAreaInset(edge: .bottom) {
                    backButton()
                }
                .alert(isPresented: $authScreenModel.errorState.showError){
                    Alert(title: Text(authScreenModel.errorState.errorMessage),  dismissButton: .default(Text("OK")))
                }
        }
    }
    
    private func backButton()->some View {
        Button{
            dismiss()
        }label: {
            HStack{
                Image(systemName: "sparkles")
                (
                    Text("Already created an account ? ")
                    +
                    Text("Log in")
                )
                Image(systemName: "sparkles")
            }
            .foregroundStyle(.white )
        }
    }
}


#Preview {
    SignUpView(authScreenModel: AuthScreenModel())
}
