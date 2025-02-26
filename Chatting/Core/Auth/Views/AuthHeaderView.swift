//
//  AuthHeaderView.swift
//  Chatting
//
//  Created by Ömer Faruk Dikili on 25.02.2025.
//

import SwiftUI


struct AuthHeaderView : View {
        var body: some View {
            HStack{
                Image(.whatsapp)
                    .resizable()
                    .frame(width: 40,height: 40)
                Text("Whatsapp")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
            }
            .foregroundStyle(.white)
        }
    }

#Preview {
    AuthHeaderView()
}
