//
//  TabItemView.swift
//  Chatting
//
//  Created by Ömer Faruk Dikili on 23.02.2025.
//

import SwiftUI

struct TabItemView: View {
    var itemImage : String
    var itemName : String
    var body: some View {
        VStack {
            Image(systemName: itemImage)
            Text(itemName)
        }
    }
}

//    .environment(\.symbolVariants, itemIndex == selectedItemIndex ?.fill : .none)

#Preview {
    TabItemView(itemImage: "String", itemName: "")
}
