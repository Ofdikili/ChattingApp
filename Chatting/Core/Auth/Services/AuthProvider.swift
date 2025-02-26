//
//  AuthProvider.swift
//  Chatting
//
//  Created by Ömer Faruk Dikili on 26.02.2025.
//

import Foundation
import Combine
import FirebaseAuth
import FirebaseDatabase

enum AuthState {
    case pending,loggedIn(UserItem),loggedOut
}

enum AuthError : Error{
    case accountCreationFailed(_ description : String)
    case failedSaveUserInfo(_ description : String)
    case emailLoginFailed(_ description : String)
}

extension AuthError : LocalizedError{
    var errorDescription:String?{
        switch self {
        case .accountCreationFailed(let description):
            return description
        case .failedSaveUserInfo(let description):
            return description
        case .emailLoginFailed(let description):
            return description
        }
    }
}

protocol AuthProvider {
    static var shared: AuthProvider {get}
    var authState: CurrentValueSubject<AuthState,Never> {get}
    func autoLogin() async
    func signIn(with email: String,and password: String) async throws
    
    func createAccount(for username: String,with email: String,and password: String) async throws
    func logOut() async throws
}

final class AuthManager : AuthProvider {

    private init(){
        Task {await autoLogin()}
    }
    static let shared: AuthProvider = AuthManager()
    
    var authState = CurrentValueSubject<AuthState, Never>(.pending)
    
    func autoLogin() async {
        if Auth.auth().currentUser == nil{
            authState.send(.loggedOut)
        }else{
            fetchCurrentUserInfo()
        }
    }
    
    func signIn(with email: String, and password: String) async throws {
        do {
            let authResult = try await Auth.auth().signIn(withEmail: email, password: password)
            fetchCurrentUserInfo()
            
        }catch{
            self.authState.send(.loggedOut)
            throw AuthError.emailLoginFailed(error.localizedDescription)

        }
    }
    
    func createAccount(for username: String, with email: String, and password: String) async throws {
        do {
            let authResult = try await Auth.auth().createUser(withEmail: email, password: password)
            let uid = authResult.user.uid
            let newUser = UserItem(uid: uid, username: username, email: email)
            try await saveUserInfoDatabase(user : newUser)
            self.authState.send(.loggedIn(newUser))
        }catch{
            self.authState.send(.loggedOut)
            throw AuthError.accountCreationFailed(error.localizedDescription)
        }
       
    }
    
    func logOut() async throws {
        do{
            try Auth.auth().signOut()
            self.authState.send(.loggedOut)
        }catch{
            self.authState.send(.loggedOut)
        }
    }

}
extension AuthManager{
    private func saveUserInfoDatabase (user : UserItem) async throws{
        do {
            let userDictionary : [String:Any] = [
                .uid:user.uid,
                .userName:user.username,
                .email:user.email
            ]
            try await FirebaseConstants.UserRef.child(user.uid).setValue(userDictionary)
        } catch {
            self.authState.send(.loggedOut)
            throw AuthError.failedSaveUserInfo(error.localizedDescription)
        }
    }
    
    private func fetchCurrentUserInfo(){
        guard let currentUserUID = Auth.auth().currentUser?.uid else {
            return
        }
        FirebaseConstants.UserRef.child(currentUserUID)
            .observe(.value) { [weak self] snapshot in
                guard let userDictionary = snapshot.value as? [String:Any] else {
                    return
                }
             
                let userData = UserItem(dictionary: userDictionary)
                self?.authState.send(.loggedIn(userData))
            
            }withCancel: { error in
                print(error.localizedDescription)
            }
    }
}
