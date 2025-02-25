//
//  BubbleTextView.swift
//  Chatting
//
//  Created by Ömer Faruk Dikili on 25.02.2025.
//

import SwiftUI

struct BubbleTextView: View {
    var item: MessageItem
    var body: some View {
        VStack(alignment: item.horizontalAignment){
            Text(item.text)
                .padding(10)
                .background(item.backgroundColor)
                .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
                .applyTail(direction: item.direction)
            timeStampTextView()
        }
        .frame(maxWidth: .infinity,alignment: item.alignment)
        .padding(.leading,  item.direction == .received ? 5:100)
        .padding(.trailing, item.direction == .received ? 100:5)
       
        
    }
    
    private func timeStampTextView() -> some View {
        HStack{
            Text("12:34 PM")
                .font(.system(size: 13))
                .foregroundColor(.gray)
            if item.direction == .sent {
                Image(.seen)
                    .resizable()
                    .renderingMode(.template)
                    .frame(width: 15, height: 15)
                    .foregroundStyle(Color(.systemBlue))
            }
        }
    }
}

#Preview{
    BubbleTextView(item: MessageItem.receivePlaceholder)
    
}

