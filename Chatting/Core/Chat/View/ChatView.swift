//
//  ChatView.swift
//  Chatting
//
//  Created by Ömer Faruk Dikili on 24.02.2025.
//

import SwiftUI

struct ChatView: View {
    @State private var vm = ChatViewModel()

    var body: some View {
        NavigationStack {
                List(){
                    archiveButton()
                    ForEach(0 ..< 5) { item in
                        ChannelItemView()
                    }
                    inboxFooterView()
                        .listRowSeparator(.hidden)
                }.navigationTitle(Text("Chats"))
                .searchable(text:$vm.text)
                .listStyle(.plain)
                .toolbar{
                    toolBarLeadingItem()
                    toolBarTralingItem()
                }
             }
             
        }
    }


extension ChatView {
    @ToolbarContentBuilder
    private func toolBarLeadingItem() -> some ToolbarContent {
        ToolbarItem(placement: .topBarLeading){
            Menu{
                Button(){
                    
                }label: {
                    Label("Select Chats",systemImage: "checkmark.circle")
                }
            }label: {
                Image(systemName: "ellipsis.circle")
                
            }
        }
    }
    @ToolbarContentBuilder
    private func toolBarTralingItem() -> some ToolbarContent {
        ToolbarItem(placement: .topBarTrailing){
            HStack(spacing:24){
                aiButton()
                cameraButton()
                plusButton()
            }
        }
    }
    private func aiButton () -> some View {
        Button{}label: {
            Image(.circle)
        }
    }
    private func cameraButton () -> some View {
        Button{}label: {
            Image(systemName: "camera")
        }
    }
    private func plusButton () -> some View {
        Button{}label: {
            Image(systemName: "plus.circle.fill")
        }
    }
    private func archiveButton () -> some View {
        Button{}
        label: {
            Label("Archived",systemImage: "archivebox.fill")
                .body
                .padding()
                .foregroundStyle(.gray)
        }
    }
    private func inboxFooterView()-> some View{
        return  HStack{
            Image(systemName: "lock.fill")

           (
            Text("Yor personal messages are ")
            +
            Text("end-to-end encrypted")
                .foregroundStyle(.blue)
           )
           .foregroundStyle(.gray)
           .font(.caption)
           .padding(.horizontal)

        }
        }
    
}

#Preview {
    ChatView()
}
