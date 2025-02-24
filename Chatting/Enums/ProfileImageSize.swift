//
//  ProfileImageSize.swift
//  Chatting
//
//  Created by Ömer Faruk Dikili on 24.02.2025.
//

import Foundation

enum ProfileImageSize{
    case xxSmall
    case xSmall
    case small
    case medium
    case large
    case xlarge
    case xxlarge
    
    var dimension : CGFloat{
        switch self {
        case .xxSmall:
            return 28
        case .xSmall:
            return 32
        case .small:
            return 40
        case .medium:
            return 56
        case .large:
            return 64
        case .xlarge:
            return 80
        case .xxlarge:
            return 120
        }
    }
}
