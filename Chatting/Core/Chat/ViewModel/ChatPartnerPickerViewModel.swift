//
//  ChatViewModel.swift
//  Chatting
//
//  Created by Ömer Faruk Dikili on 24.02.2025.
//

import Foundation

enum ChannelCreationRouteType{
    case groupPartnerPicker
    case setUpGroupChat
}

enum ChannelConstants {
    static let maxGroupChatMemberCount : Int = 12
}

final class ChatPartnerPickerViewModel : ObservableObject {
    @Published var navStack = [ChannelCreationRouteType]()
    @Published var selectedChatPartner = [UserItem]()
    
//    init() {
//        self.allChatPartners = UserItem.placeholdersOfUsers
//    }
//    
//    var totalPartnersCount : Int {
//        return allChatPartners.count
//    } 
    
    var totalSelectedUsersCount : Int {
        return selectedChatPartner.count
    }
    
    var disabledNextButton : Bool {
        return selectedChatPartner.isEmpty
    }
    
    var showSelectedUserArea : Bool {
         return !selectedChatPartner.isEmpty
    }
    
    func isSelected(_ user: UserItem) -> Bool {
       return  selectedChatPartner.contains(where: { $0.id == user.id })
    }
    func removeSelectedPartner(_ user: UserItem) {
        selectedChatPartner.removeAll(where: { $0.id == user.id })
    }
    
    func handleItemSelection(_ item: UserItem) {
        if isSelected(item){
            removeSelectedPartner(item)
        } else {
            selectedChatPartner.append(item)    
        }
    }
}
