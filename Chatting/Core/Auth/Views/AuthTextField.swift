//
//  AuthTextField.swift
//  Chatting
//
//  Created by Ömer Faruk Dikili on 25.02.2025.
//

import Foundation
import SwiftUI

struct AuthTextField : View{
    @Binding var text: String
    var inputType : InputType
    var body: some View{
        HStack{
            Image(systemName: inputType.iconName)
                .fontWeight(.bold)
                .frame(width: 32)
            switch(inputType){
            case .password:
                SecureField(inputType.placeHolder, text: $text)
            default:
                TextField(inputType.placeHolder, text: $text)
            }
         }
        .foregroundStyle(.white)
        .padding()
        .background(Color.white.opacity(0.3))
        .clipShape(RoundedRectangle(cornerRadius: 10,style: .continuous))
        .padding(.horizontal,32)
    }
}

enum InputType {
    case email
    case password
    case custom(placeHolder : String, iconName: String)
    
    var placeHolder : String {
        switch self {
        case .email:
            return "Email"
        case .password:
            return "Password"
        case .custom(let placeHolder, _):
            return placeHolder
        }
    }
    
    var iconName :String{
        switch self {
        case .email:
            return "envelope"
        case .password:
            return "lock"
        case .custom(_, let iconName):
            return iconName
        }
    }
    
    func keyboardType() -> UIKeyboardType {
        switch self {
        case .email:
            return .emailAddress
        default:
            return .default
        }
    }
    
}

#Preview {
    ZStack{
        Color.teal
        VStack{
            Spacer()
            AuthTextField(text: .constant(""), inputType: .email)
            AuthTextField(text: .constant(""), inputType: .password)
            Spacer()

        }
    }
}
