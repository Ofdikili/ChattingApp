//
//  InboxView.swift
//  Chatting
//
//  Created by Ömer Faruk Dikili on 23.02.2025.
//

import SwiftUI

struct InboxView: View {
    @StateObject private var vm = InBoxViewModel()
    var body: some View {
        NavigationStack {
            ZStack(alignment: .bottomTrailing){
                List{
                    ForEach(0..<10){_ in
                        InBoxMesageView()
                    }
                }
                Button(
                    action:{
                        vm.showNewMessage.toggle()
                    },
                    label: {
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color(.darkGray))
                            .frame(width: 50, height: 50)
                            .padding()
                            .overlay(
                                Image(systemName: "plus.bubble.fill")
                                    .foregroundStyle(.white)
                            )
                    }
                )
                
                    
            }
            .fullScreenCover(isPresented: $vm.showNewMessage, content: {
                NewMessageView()
            })
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Text("Whatsapp")
                        .font(.title3)
                        .fontWeight(.semibold)
                        .foregroundStyle(.white)
                }
                ToolbarItem(placement: .topBarTrailing) {
                    HStack(spacing:24){
                       
                        Image(systemName: "camera")
                        Image(systemName: "magnifyingglass")
                        Image(systemName: "ellipsis")
                    }.foregroundStyle(.white)
                                        }
                
            }                .toolbarBackground(Color(.darkGray), for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)

        }
    }
}

#Preview {
    InboxView()
}
