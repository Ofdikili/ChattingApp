//
//  User.swift
//  Chatting
//
//  Created by Ömer Faruk Dikili on 24.02.2025.
//

import Foundation

struct User : Codable , Identifiable{
    let id: String
    let fullName: String
    let email: String
    let phoneNumber: String
    let profileImageUrl: String?
}

extension User {
    static let MOCK_User = User(
        id: "12345",
        fullName: "Ömer Faruk Dikili",
        email: "omerfarukdikili00@gmail.com",
        phoneNumber: "+90 541 846 38 22",
        profileImageUrl: "elizabeth"
    )
}
