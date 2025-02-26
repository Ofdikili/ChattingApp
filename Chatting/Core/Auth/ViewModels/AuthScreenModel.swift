//
//  AuthScreenModel.swift
//  Chatting
//
//  Created by Ömer Faruk Dikili on 25.02.2025.
//

import Foundation

@MainActor
final class AuthScreenModel : ObservableObject{
    @Published var isLoading: Bool = false
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var username: String = ""
    @Published var errorState: (showError: Bool, errorMessage: String) = (false, "")
    var disableLoginButton: Bool {
        return email.isEmpty || password.isEmpty || isLoading
    }
    
    var disableSignUpButton: Bool {
        return email.isEmpty || password.isEmpty || isLoading
    }
    
    func handleSignUp() async{
        isLoading = true
        do {
            try await AuthManager.shared.createAccount(for: username, with:email, and: password)
        }catch{
            errorState = (true,"Failed to create an account \(error.localizedDescription)")
            isLoading = false

        }
    }
    
    func handleLogin() async{
        isLoading = true
        do {
            try await AuthManager.shared.signIn( with:email, and: password)
        }catch{
            errorState = (true,"Failed to create an account \(error.localizedDescription)")
            isLoading = false

        }
    }
    
}
