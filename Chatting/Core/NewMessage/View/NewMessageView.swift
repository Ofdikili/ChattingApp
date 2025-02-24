//
//  NewMessageView.swift
//  Chatting
//
//  Created by Ömer Faruk Dikili on 24.02.2025.
//

import SwiftUI

struct NewMessageView: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack {
            ScrollView {
                 contactArea
                .padding(.top)
                Text("Contacts on Whatsapp")
                    .foregroundStyle(Color(.darkGray))
                    .padding(.vertical)
                    .frame(maxWidth: .infinity, alignment: .leading)
                HStack {
                    ProfileImageView(
                        profileImageSize: .small, user: User.MOCK_User
                    )
                    VStack(alignment: .leading,spacing: 4){
                        Text("Elizabeth")
                            .fontWeight(.semibold)
                        Text("Hi there! I am using Whatsapp").foregroundStyle(Color(.systemGray))
                            .lineLimit(2)
                    }
                    .font(.subheadline)
                } .frame(maxWidth: .infinity, alignment: .leading)
            }.padding(.horizontal)
            .toolbarModifier(dismiss: dismiss)
        }
    }
}
extension NewMessageView {
    var contactArea: some View {
        VStack(alignment: .trailing, spacing: 24){
            ContactView(imageName: "person.2.circle.fill", title: "New Group")
            ContactView(imageName: "person.circle.fill", title: "New contact")
            ContactView(imageName: "shared.with.you.circle.fill", title: "New comunity")
        }
    }
}
extension View {
    func toolbarModifier(dismiss: DismissAction) -> some View {
        self.toolbar {
            ToolbarItem(placement: .topBarLeading) {
                HStack(spacing: 12) {
                    Button(action: { dismiss() }) {
                        Image(systemName: "arrow.backward")
                    }
                    VStack(alignment: .leading) {
                        Text("Select Contact")
                        Text("8 contacts")
                    }
                }
                .foregroundStyle(.white)
            }
                
            ToolbarItem(placement: .topBarTrailing) {
                HStack(spacing: 12) {
                    Image(systemName: "magnifyingglass")
                    Image(systemName: "ellipsis")
                }
                .foregroundStyle(.white)
            }
        }
        .toolbarBackground(Color(.darkGray))
        .toolbarBackgroundVisibility(.visible)
    }
}

#Preview {
    NewMessageView()
}

struct ContactView: View {
    var imageName:String
    var title:String
    var body: some View {
        HStack{
            Image(systemName:imageName)
                .resizable()
                .frame(width: 40, height: 40)
                .foregroundColor(.gray)
            Text(title)
                .font(.headline)
                .fontWeight(.semibold)
            Spacer()
        }
    }
}
