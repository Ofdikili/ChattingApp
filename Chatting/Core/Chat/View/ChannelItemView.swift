//
//  ChannelItemView.swift
//  Chatting
//
//  Created by Ömer Faruk Dikili on 25.02.2025.
//

import SwiftUI

struct ChannelItemView: View {
    var body: some View {
        HStack(alignment: .top,spacing: 10){
            Image(systemName: "person.circle.fill")
                .resizable()
                .frame(width: 55, height: 55)
                .foregroundStyle(.gray)
            VStack(alignment:.leading,spacing: 4){
                titleTextView()
                lastMessagePreview()
            }
        }
    }
    
    private func titleTextView()-> some View{
        return  HStack(){
            Text("Omer Dikili")
                .lineLimit(1)
                .bold()
            Spacer()
            HStack{
                Text("12:34")
                    .foregroundStyle(.gray)
                    .font(.system(size:15))
            }
        }
    }
    private func lastMessagePreview()-> some View{
        return  Text("Hey Welcome")
            .lineLimit(1)
            .font(.system(size:15))
        }
    
}

#Preview {
    ChannelItemView()
}
