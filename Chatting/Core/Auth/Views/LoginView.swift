//
//  LoginView.swift
//  Chatting
//
//  Created by Ömer Faruk Dikili on 25.02.2025.
//

import SwiftUI

struct LoginView: View {
    @StateObject private var authScreenModel = AuthScreenModel()
    var body: some View {
        NavigationStack{
            VStack{
                Spacer()
                AuthHeaderView()
                AuthTextField(text:$authScreenModel.email,inputType: InputType.email)
                AuthTextField(text:$authScreenModel.password,inputType: InputType.password)
                forgotPasswordButton()
                AuthButton(title: "Log in Now", onTap: {
                    Task {
                        await authScreenModel.handleLogin()
                    }
                })
                    .disabled(authScreenModel.disableLoginButton)
                Spacer()
            }.frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color.teal.gradient)
                .ignoresSafeArea(.all)
                .safeAreaInset(edge: .bottom) {
                    signupButton()
                }
                .alert(isPresented : $authScreenModel.errorState.showError){
                    Alert(title: Text(authScreenModel.errorState.errorMessage),  dismissButton: .default(Text("OK")))
                }
        }
    }
    
    private func forgotPasswordButton()->some View {
        Button{
            
        }label:{
            Text("Forgot Password ?")
                .foregroundStyle(.white)
                .frame(maxWidth: .infinity, alignment: .trailing)
                .padding(.trailing,32)
                .bold()
                .padding(.vertical)
        }
    }
    
    private func signupButton()->some View {
        NavigationLink{
            SignUpView(authScreenModel: authScreenModel)
        }label: {
            HStack{
                Image(systemName: "sparkles")
                (
                    Text("Dont have an account ? ")
                    +
                    Text("Create One")
                )
                Image(systemName: "sparkles")
            }
            .foregroundStyle(.white )
        }
    }
}

#Preview {
    LoginView()
}
