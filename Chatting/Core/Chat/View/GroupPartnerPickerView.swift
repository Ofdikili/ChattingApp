//
//  AddGroupChatPartnerView.swift
//  Chatting
//
//  Created by Ömer Faruk Dikili on 26.02.2025.
//

import SwiftUI

struct GroupPartnerPickerView: View {
    @ObservedObject var vm : ChatPartnerPickerViewModel
    var body: some View {
        List{
            
            if vm.showSelectedUserArea {
                SelectedChatPartnerView(users:vm.selectedChatPartner){
                    user in vm.removeSelectedPartner(user)
                }
            }
            Section {
                ForEach(UserItem.placeholdersOfUsers) { user in
                    Button{
                        vm.handleItemSelection(user)
                    }label:{
                        chatPartnerRowView(user)
                    }
                }
            }
        }
        .searchable(text: .constant(""),
                    prompt: "Search name or number"
        ).toolbar{
            pricibalToolbarContent()
            tralingToolbarContent()
        }
    }
    private func chatPartnerRowView(_ user:UserItem) -> some View {
        ChatPartnerRowView(user: user){
            let isSelected = vm.isSelected(user)
            let imageName = isSelected ? "checkmark.circle.fill": "circle"
            let foregroundStyle : Color = isSelected ? Color.blue : Color(.systemGray4)
            Spacer()
            Image(systemName: imageName)
                .foregroundStyle(foregroundStyle)
                .imageScale(.large)
                
        }
    }
}

extension GroupPartnerPickerView {
    @ToolbarContentBuilder
    func pricibalToolbarContent() -> some ToolbarContent {
        ToolbarItem(placement: .principal){
            VStack{
                Text("Add Participants")
                    .bold()
                Text("\(vm.totalSelectedUsersCount)/\(ChannelConstants.maxGroupChatMemberCount)")
                    .foregroundStyle(.gray)
                    .font(.footnote)
            }
        }
    }
    @ToolbarContentBuilder
    func tralingToolbarContent() -> some ToolbarContent {
        ToolbarItem(placement: .topBarTrailing){
            Button{
                vm.navStack.append(.setUpGroupChat)
            }label: {
                Text("Next")
            }
            .bold()
            .disabled(vm.disabledNextButton)
        }
    }

}

#Preview {
    return GroupPartnerPickerView(
        vm: ChatPartnerPickerViewModel()
    )
}
