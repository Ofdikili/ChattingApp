//
//  InboxView.swift
//  Chatting
//
//  Created by Ömer Faruk Dikili on 23.02.2025.
//

import SwiftUI

struct CallsView: View {
    @State var searchText: String = ""
    @State var selectedCallHistoryType : CallHistoryType = .all
    var body: some View {
        NavigationStack{
            List{
                Section(){
                    CreateCallLinkSection()
                }
                Section(){
                    CallHistorySection()
                }header:{
                    Text("Recent Calls")
                        .textCase(nil)
                        .font(.headline)
                        .bold()
                        .foregroundStyle(.whatsAppBlack)
                }

                }
            .navigationTitle(Text("Calls"))
            .searchable(text:$searchText)
            .toolbar{
                leadingToolBarItems()
                tralingToolBarItems()
                prencipalToolBarItem()
            }
        }
    }
}

extension CallsView {
    @ToolbarContentBuilder
    private func leadingToolBarItems() -> some ToolbarContent {
        ToolbarItem(placement: .topBarLeading) {
            Button("Edit") {
            }
        }
    }
    @ToolbarContentBuilder
    private func prencipalToolBarItem() -> some ToolbarContent {
        ToolbarItem(placement: .principal) {
            Picker("Call History", selection: $selectedCallHistoryType) {
                ForEach(CallHistoryType.allCases) { item in
                    Text(item.rawValue.capitalized)
                        .tag(item)
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            .frame(width:150)
        }
    }
    
    @ToolbarContentBuilder
    private func tralingToolBarItems() -> some ToolbarContent {
        ToolbarItem(placement: .topBarTrailing) {
            Button{
                
            }label: {
                Image(systemName: "phone.arrow.up.right")
            }
           
        }
    }
}

private struct CreateCallLinkSection : View {
    var body: some View {
        HStack{
            Image(systemName: "link")
                .padding(8)
                .background(Color(.systemGray6))
                .foregroundStyle(.blue)
                .clipShape(Circle())
            VStack(alignment:.leading){
                Text("Create Call Link")
                    .font(.callout)
                    .bold(true)
                    .foregroundStyle(.blue)
                Text("Share a link for quick calls")
                    .foregroundStyle(.gray)

            }
        }
    }
}

private struct CallHistorySection : View {
    var body: some View {
        ForEach(0..<5){_ in
            RecentCallItemView()
        }
    }
}

private struct RecentCallItemView : View {
    var body: some View {
        HStack{
            Circle().frame(width: 44, height: 44)
            recentCallsTextView()
            Spacer()
            Text("Yesterday").font(.system(size: 16))
                .foregroundStyle(.gray)
            Image(systemName: "info.circle")
        }
    }
    
    private func recentCallsTextView()-> some View{
        VStack(alignment:.leading){
            Text("Ömer Dİkili")
            HStack(spacing:6){
                Image(systemName: "phone.arrow.up.right.fill")
                Text("Outgoing")
                    .foregroundStyle(.secondary)
                
            }.font(.system(size: 14))
                .foregroundStyle(.gray)
        }
    }
}

#Preview {
    CallsView()
}
