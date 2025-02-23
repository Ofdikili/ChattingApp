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
    var itemIndex : Int
    var selectedItemIndex : Int
    var body: some View {
        VStack {
            Image(systemName: itemImage)
                .environment(\.symbolVariants, itemIndex == selectedItemIndex ?.fill : .none)
            Text(itemName)
        }
    }
}

#Preview {
    TabItemView(itemImage: "String", itemName: "", itemIndex: 1,selectedItemIndex: 1)
}
