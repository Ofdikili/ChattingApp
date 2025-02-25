//
//  MessageItem.swift
//  Chatting
//
//  Created by Ömer Faruk Dikili on 25.02.2025.
//

import Foundation
import SwiftUI
struct MessageItem : Identifiable {
    let id = UUID().uuidString
    let text : String
    let direction : MessageDirection
    let messageType : MessageType
    
    static let sentPlaceholder = MessageItem(text: "Hello message", direction: .sent,messageType: .text)
    static let receivePlaceholder = MessageItem(text: "Hello message", direction: .received,messageType: .text)
    static let audioPlaceholder = MessageItem(text: "", direction: .sent,messageType: .audio)
    
    static let stubMessages : [MessageItem] =
    [
        MessageItem(text: "Hi There", direction: .sent,messageType: .text),
        MessageItem(text: "Check Out this photo", direction: .received,messageType: .photo),
        MessageItem(text: "Play Out this video", direction: .sent,messageType: .video),
        MessageItem(text: "", direction: .sent,messageType: .audio)
        
    ]
    
    var backgroundColor : Color {
        switch direction {
        case .sent:
            return .bubbleGreen
        case .received:
            return .bubbleWhite
        }
    }
    
    var alignment : Alignment {
        return direction == .received ? .leading : .trailing
    }
    
    var horizontalAignment : HorizontalAlignment {
        return direction == .received ? .leading : .trailing
    }
}
enum MessageType {
    case text, photo, video , audio
}

enum MessageDirection {
    case sent
    case received
    
    static var random : MessageDirection {
        return [.sent, .received].randomElement() ?? .sent
    }
}
