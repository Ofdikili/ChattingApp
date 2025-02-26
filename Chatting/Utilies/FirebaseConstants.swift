//
//  FirebaseConstants.swift
//  Chatting
//
//  Created by Ömer Faruk Dikili on 26.02.2025.
//

import Foundation
import Firebase
import FirebaseStorage


enum FirebaseConstants {
    private static let  DatabaseRef = Database.database().reference()
    static let UserRef  = DatabaseRef.child("users")
}
