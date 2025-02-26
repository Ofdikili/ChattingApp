//
//  ChatViewModel.swift
//  Chatting
//
//  Created by Ömer Faruk Dikili on 26.02.2025.
//
import Foundation
import Observation

final class ChatViewModel : ObservableObject {
    @Published var showChatPartnerPickerView = false
    @Published var text: String = ""
}
