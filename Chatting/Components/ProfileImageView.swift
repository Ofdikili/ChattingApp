//
//  ProfileImageView.swift
//  Chatting
//
//  Created by Ömer Faruk Dikili on 24.02.2025.
//

import Foundation
import SwiftUI

struct ProfileImageView: View {
    var profileImageSize : ProfileImageSize
    var user : User?
    init(profileImageSize: ProfileImageSize,user: User?) {
        self.profileImageSize = profileImageSize
        self.user = user
    }
    var body: some View {
        if let profileImagePath = user?.profileImageUrl {
            Image(profileImagePath)
                .resizable()
                .frame(width: profileImageSize.dimension, height: profileImageSize.dimension)
                .clipShape(Circle())
        }else{
            Image(systemName: "person.circle.fill")
                .resizable()
                .frame(width: profileImageSize.dimension, height: profileImageSize.dimension)
                .clipShape(Circle())
        }
        
    }
}
