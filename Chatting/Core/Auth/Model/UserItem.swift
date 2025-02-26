//
//  UserItem.swift
//  Chatting
//
//  Created by Ömer Faruk Dikili on 26.02.2025.
//

import Foundation

struct UserItem : Identifiable ,Hashable,Decodable{
    let uid: String
    let username: String
    let email: String
    var bio : String?
    var profileImageURL : String? = nil
    
    var id : String{
        return uid
    }
    
    var bioUnwrapped : String{
        return bio ?? "Hey There I am using Chatting App"
    }
    
    static let placeHolderUser = UserItem(
        uid: "1", username: "ofd@ofd", email: "ofd@ofd.com.tr"
    )
}

extension UserItem{
    init(dictionary : [String: Any]){
        self.uid = dictionary[.uid] as? String ?? ""
        self.username = dictionary[.userName] as? String ?? ""
        self.email = dictionary[.email] as? String ?? ""
        self.bio = dictionary[.bio] as? String ?? nil
        self.profileImageURL = dictionary[.profileImageURL] as? String ?? nil
    }
}

extension String{
    static let uid = "uid"
    static let userName = "userName"
    static let email = "email"
    static let bio = "bio"
    static let profileImageURL = "profileImageURL"
}
