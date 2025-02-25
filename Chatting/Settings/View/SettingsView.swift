//
//  SettingsView.swift
//  Chatting
//
//  Created by Ömer Faruk Dikili on 25.02.2025.
//

import SwiftUI

struct SettingsView: View {
    @State var searchText: String = ""
    var body: some View {
        NavigationStack{
            List{
                UserInfoView()
                Section {
                    SettingsItemView(item: .broadCastLists)
                    SettingsItemView(item: .starredMessages)
                    SettingsItemView(item: .linkedDevices)
                }
                
                Section {
                    SettingsItemView(item: .account)
                    SettingsItemView(item: .privacy)
                    SettingsItemView(item: .chats)
                    SettingsItemView(item: .notifications)
                    SettingsItemView(item: .storage)
                }
                
                Section {
                    SettingsItemView(item: .help)
                    SettingsItemView(item: .tellFriend)
                }
            }
            .navigationTitle(Text("Settings"))
            .searchable(text: $searchText)
            .toolbar{
                settingsToolbarTraling()
            }
        }
    }
}

extension SettingsView{
    
    private func settingsToolbarTraling() -> some ToolbarContent {
        return  ToolbarItem{
            Button("Save"){
                
            } .bold()

        }
    }
}

private struct UserInfoView : View {
    var body: some View {
        Section{
                HStack{
                    Circle()
                        .frame(width: 50,height: 50)
                    userInfoTextView()
                }
            SettingsItemView(item: .avatar)
            
            }
    }
    private struct userInfoTextView : View {
        var body: some View {
            VStack(alignment: .leading, spacing: 3){
                HStack(){
                    Text("User Name")
                        .font(.title2)
                    Spacer()
                    Image(.qrcode)
                        .renderingMode(.template)
                        .padding(5)
                        .background(Color(.systemGray5))
                        .clipShape(Circle())
                }
                Text("Hi there! I am using SwiftUI")
            }
        }
    }
}



#Preview {
    SettingsView()
}
