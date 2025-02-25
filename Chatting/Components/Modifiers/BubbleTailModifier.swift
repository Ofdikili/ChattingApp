//
//  BubbleTailModifier.swift
//  Chatting
//
//  Created by Ömer Faruk Dikili on 25.02.2025.
//

import SwiftUI
private struct BubbleTailModifier: ViewModifier {
    var direction: MessageDirection
    
    func body(content: Content) -> some View {
        content.overlay(alignment: direction == .received ? .bottomLeading : .bottomTrailing){
            BubbleTailView(direction: direction)
        }
    }
}

extension View {
    func applyTail(direction: MessageDirection) -> some View {
        self.modifier(BubbleTailModifier(direction: direction))
    }
}
