//
//  LanguageType.swift
//  Chatting
//
//  Created by Ömer Faruk Dikili on 23.02.2025.
//

import Foundation
import SwiftUI
enum LanguageType : String, CaseIterable{
    case english = "en"
    case turkish = "tr"
}
extension LanguageType {
    func getLanguageCode() -> LocalizedStringKey {
        switch self {
        case .english:
            return LocalizedStringKey("english")
        case .turkish:
            return LocalizedStringKey("turkish")
        }
    }
}
