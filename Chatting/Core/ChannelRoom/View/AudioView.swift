//
//  AudioView.swift
//  Chatting
//
//  Created by Ömer Faruk Dikili on 25.02.2025.
//

import SwiftUI

struct AudioView: View {
    var item : MessageItem
    @State private var sliderRange : ClosedRange<Double> = 0...20
    @State private var sliderValue : Double  = 10
    
    var body: some View {
        VStack(alignment: item.horizontalAignment){
            HStack{
                playButton()
                Slider(value: $sliderValue, in: sliderRange)
                    .tint(.gray)
                Text("04:00")
            }.padding(10)
                .background(Color.gray.opacity(0.1))
                .clipShape(RoundedRectangle(cornerRadius: 16))
                .padding(5)
                .background(item.backgroundColor)
                .clipShape(RoundedRectangle(cornerRadius: 16))
                .applyTail(direction: item.direction)
//            if item.direction == .received{
//                Spacer()
//            }
            timeStampTextView()
        }.frame(maxWidth: .infinity,alignment: item.alignment)
            .padding(.leading,  item.direction == .received ? 5:100)
            .padding(.trailing, item.direction == .received ? 100:5)
    }
   
    private func playButton() -> some View {
        Button{}label: {
            Image(systemName: "play.fill")
                .padding(10)
                .background(item.direction == .received ? .green : .white)
                .clipShape(Circle())
                .foregroundStyle(item.direction == .received ? .white : .black)
        }
    }
    
    private func timeStampTextView() -> some View {
        HStack {
            Text("11:13 AM")
                .font(.system(size: 12))
            
            if item.direction == .sent {
                Image(.seen)
                    .resizable()
                    .renderingMode(.template)
                    .frame(width: 15, height: 15)
            }
        }
    }

}

#Preview {
    AudioView(item: MessageItem.audioPlaceholder)
}
