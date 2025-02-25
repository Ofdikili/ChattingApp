//
//  MessageListView.swift
//  Chatting
//
//  Created by Ömer Faruk Dikili on 25.02.2025.
//

import Foundation
import SwiftUI

struct MessageListView : UIViewControllerRepresentable{
    
    typealias UIViewControllerType = MessageListController
    
    func makeUIViewController(context: Context) ->  MessageListController {
        let messageListController = MessageListController()
        return messageListController
    }
    func updateUIViewController(_ uiViewController: MessageListController, context: Context) {
        
    }
}

#Preview {
    MessageListView()
}
