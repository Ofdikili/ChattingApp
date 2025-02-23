//
//  TabbarView.swift
//  Chatting
//
//  Created by Ömer Faruk Dikili on 23.02.2025.
//

import SwiftUI

struct TabbarView: View {
    @State private var selectedTabIndex: Int = 0
    var body: some View {
        TabView {
            InboxView()
            .tabItem {
                TabItemView(
                    itemImage: "bubble.fill", itemName: "Chats",
                    itemIndex: 0,
                    selectedItemIndex: selectedTabIndex
                )
            }
            UpdatesView()
            .tabItem {
                TabItemView(
                    itemImage: "dial.low", itemName: "Updates",
                    itemIndex: 1,
                    selectedItemIndex: selectedTabIndex
                )
               
            }
            CommunitiesView()
            .tabItem {
                TabItemView(
                    itemImage: "person.3", itemName: "Communities",
                    itemIndex: 2,
                    selectedItemIndex: selectedTabIndex
                )
                
            }
            CallsView()
            .tabItem {
                TabItemView(
                    itemImage: "phone", itemName: "Calls",
                    itemIndex: 3,
                    selectedItemIndex: selectedTabIndex
                )
                
            }
        }
    }
}

#Preview {
    TabbarView()
}
