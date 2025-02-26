//
//  RootViewModel.swift
//  Chatting
//
//  Created by Ömer Faruk Dikili on 26.02.2025.
//

import Foundation
import Combine

final class RootViewModel : ObservableObject{
    @Published private(set) var authState = AuthState.pending
    private var cancellables: Set<AnyCancellable> = []
    
    init(){
        AuthManager.shared.authState.receive(on: DispatchQueue.main)
            .sink { [weak self] latestAuthState in
            self?.authState = latestAuthState
        }
            .store(in: &cancellables)
    }
    
}
