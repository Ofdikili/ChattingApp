//
//  InBoxMesageView.swift
//  Chatting
//
//  Created by Ömer Faruk Dikili on 24.02.2025.
//

import SwiftUI

struct InBoxMesageView: View {
    var body: some View {
        HStack(spacing:12){
            ProfileImageView(profileImageSize: .medium,user:User.MOCK_User)

            VStack(alignment: .leading,spacing: 4){
                Text("Elizabeth")
                    .fontWeight(.semibold)
                Text("Selam").foregroundStyle(Color(.systemGray))
                    .lineLimit(2)
            }
            .font(.subheadline)
            Spacer()
                HStack(){
                    Text("Yesterday")
                        .font(.subheadline)
                        .foregroundStyle(Color(.systemGray))
                    Image(systemName: "chevron.right").foregroundStyle(Color(.systemGray))

                }
                
                
            }
        }
    
}

#Preview {
    InBoxMesageView()
}
