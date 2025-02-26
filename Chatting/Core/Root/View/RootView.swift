//
//  RootView.swift
//  Chatting
//
//  Created by Ömer Faruk Dikili on 26.02.2025.
//

import SwiftUI

struct RootView: View {
    @StateObject private var viewModel = RootViewModel()
    var body: some View {
        switch(viewModel.authState){
        case .pending:
            ProgressView()
        case .loggedIn(let loggedUser):
            MainTabView(loggedUser)
        case .loggedOut:
            LoginView()
        }
    }
}

#Preview {
    RootView()
}
