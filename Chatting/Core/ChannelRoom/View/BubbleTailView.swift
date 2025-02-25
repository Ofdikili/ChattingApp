//
//  BubbleTailView.swift
//  Chatting
//
//  Created by Ömer Faruk Dikili on 25.02.2025.
//

import SwiftUI

struct BubbleTailView: View {
    var direction : MessageDirection
    private var  backgroundColor: Color {
        return direction == .received ?
            .bubbleWhite : .bubbleGreen
    }
    var body: some View {
        Image(direction == .sent ? .outgoingTail : .incomingTail)
            .renderingMode(.template)
            .resizable()
            .frame(width: 10, height: 10)
            .offset(y:3)
            .foregroundStyle(backgroundColor)
    }
}

#Preview {
    BubbleTailView(direction: .random)
}


//import SwiftUI
//
//struct ChatBubble: Shape {
//    var isReceived: Bool
//
//    func path(in rect: CGRect) -> Path {
//        var path = Path()
//        
//        if isReceived {
//            path.move(to: CGPoint(x: rect.minX + 10, y: rect.maxY - 10))
//            path.addQuadCurve(to: CGPoint(x: rect.minX, y: rect.maxY), control: CGPoint(x: rect.minX + 5, y: rect.maxY))
//            path.addQuadCurve(to: CGPoint(x: rect.minX + 10, y: rect.maxY - 5), control: CGPoint(x: rect.minX + 5, y: rect.maxY - 5))
//            path.addLine(to: CGPoint(x: rect.minX + 10, y: rect.maxY - 10))
//        } else {
//            path.move(to: CGPoint(x: rect.maxX - 10, y: rect.maxY - 10))
//            path.addQuadCurve(to: CGPoint(x: rect.maxX, y: rect.maxY), control: CGPoint(x: rect.maxX - 5, y: rect.maxY))
//            path.addQuadCurve(to: CGPoint(x: rect.maxX - 10, y: rect.maxY - 5), control: CGPoint(x: rect.maxX - 5, y: rect.maxY - 5))
//            path.addLine(to: CGPoint(x: rect.maxX - 10, y: rect.maxY - 10))
//        }
//        
//        path.addRoundedRect(in: CGRect(x: isReceived ? rect.minX + 10 : rect.minX,
//                                       y: rect.minY,
//                                       width: rect.width - 10,
//                                       height: rect.height),
//                            cornerSize: CGSize(width: 15, height: 15))
//        
//        return path
//    }
//}
//
//struct MessageBubbleView: View {
//    var message: String
//    var isReceived: Bool
//
//    var body: some View {
//        Text(message)
//            .padding(12)
//            .background(isReceived ? Color.gray.opacity(0.2) : Color.blue)
//            .foregroundColor(isReceived ? .black : .white)
//            .clipShape(ChatBubble(isReceived: isReceived))
//            .frame(maxWidth: 250, alignment: isReceived ? .leading : .trailing)
//            .padding(isReceived ? .leading : .trailing, 20)
//    }
//}
//
//struct ContentView: View {
//    var body: some View {
//        VStack(spacing: 10) {
//            MessageBubbleView(message: "Merhaba, nasılsın?", isReceived: true)
//            MessageBubbleView(message: "İyiyim, sen nasılsın?", isReceived: false)
//            MessageBubbleView(message: "Ben de iyiyim, teşekkürler!", isReceived: true)
//        }
//        .padding()
//    }
//}
//
//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
