import SwiftUI

struct ChatPartnerRowView<Content: View> : View {
    let user: UserItem
    private let tralingItem: Content
    init(user: UserItem,@ViewBuilder content : () -> Content = {EmptyView()}) {
        self.user = user
        self.tralingItem = content()
    }
    
    var body: some View {
        HStack {
            Circle()
                .frame(width: 40, height: 40)
            
            VStack(alignment: .leading) {
                Text(user.username)
                    .bold()
                    .foregroundStyle(.whatsAppBlack)
                
                Text(user.bioUnwrapped)
                    .font(.caption)
                    .foregroundStyle(.gray)
            }
            tralingItem
        }
    }
}

#Preview {
    ChatPartnerRowView(user: .placeHolderUser)
}
