//
//  AuthButton.swift
//  Chatting
//
//  Created by Ömer Faruk Dikili on 25.02.2025.
//

import SwiftUI

struct AuthButton: View {
    let title: String
    let onTap: () -> Void
    @Environment(\.isEnabled) private var isEnabled
    
    private var backGroundColor : Color {
        return isEnabled ? Color.white : Color.white.opacity(0.3)
    }
    
    private var textColor : Color {
        return isEnabled ? Color.green : Color.white
    }
    
    var body: some View {
        Button{
            onTap()
        }label: {
            HStack{
                Text(title)
                Image(systemName: "arrow.right")
            }
            .font(.headline)
            .foregroundStyle(textColor)
            .padding()
            .frame(maxWidth:.infinity)
            .background(backGroundColor)
            .clipShape(RoundedRectangle(cornerRadius: 10,style: .continuous))
            .shadow(color:.green.opacity(0.2),radius: 10)
            .padding(.horizontal,32)
            
        }
    }
}

#Preview {
    ZStack{
        Color.teal
        AuthButton(title: "Login", onTap: {})
    }
}
