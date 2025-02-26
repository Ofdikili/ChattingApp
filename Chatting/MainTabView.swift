//
//  TabbarView.swift
//  Chatting
//
//  Created by Ömer Faruk Dikili on 23.02.2025.
//

import SwiftUI

struct MainTabView: View {
    var currentUser : UserItem
    init(_ user : UserItem) {
        self.currentUser = user
        makeTabBarOpaque()
    }
    
    var body: some View {
        TabView {
            UpdatesView()
            .tabItem {
                TabItemView(
                    itemImage: Tab.update.icon, itemName: Tab.update.title
                )
            }
            CallsView()
            .tabItem {
                TabItemView(
                    itemImage: Tab.calls.icon, itemName: Tab.calls.title
                )
               
            }
            CommunitiesView()
            .tabItem {
                TabItemView(
                    itemImage: Tab.communities.icon, itemName: Tab.communities.title)
              }
            ChatView()
            .tabItem {
                TabItemView(
                    itemImage: Tab.chats.icon, itemName: Tab.chats.title )
                
            }
            SettingsView()
            .tabItem {
                TabItemView(
                    itemImage: Tab.settings.icon, itemName: Tab.settings.title )
                
            }
        }
    }
    
    func makeTabBarOpaque(){
        let appearance = UITabBarAppearance()
        appearance.configureWithOpaqueBackground()
        UITabBar.appearance().standardAppearance = appearance
        UITabBar.appearance().scrollEdgeAppearance = appearance
    }
}

extension MainTabView {
    private enum Tab : String{
        case update,calls,communities,chats,settings
        
        fileprivate var title: String {
            return rawValue.capitalized
        }
        
        fileprivate var icon: String {
            switch self {
            case .update:
                return "circle.dashed.inset.fill"
            case .calls:
                return "phone"
            case .communities:
                return "person.3"
            case .chats:
                return "message"
            case .settings:
                return "gear"

            }
        }
    }
}

#Preview {
    MainTabView(UserItem.placeHolderUser)
}
