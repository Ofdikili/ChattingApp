//
//  File.swift
//  Chatting
//
//  Created by Ömer Faruk Dikili on 25.02.2025.
//

import Foundation
enum CallHistoryType : String, CaseIterable , Identifiable {
    case all
    case missed
    
    var id : String {
        return rawValue
    }
    
}
