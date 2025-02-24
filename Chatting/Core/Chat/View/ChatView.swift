//
//  ChatView.swift
//  Chatting
//
//  Created by Ömer Faruk Dikili on 24.02.2025.
//

import SwiftUI

struct ChatView: View {
    @State private var vm = ChatViewModel()

    var body: some View {
        NavigationStack {
            VStack{
                ScrollView{
                    Text("Ofd")
                 }
                .scrollIndicators(.never)
                Spacer()
                
                HStack{
                    ZStack{
                        TextField("Message...", text: $vm.text)
                            .padding(.vertical,12)
                            .padding(.leading,44)
                            .padding(.trailing,60)
                            .background(Color(.systemGroupedBackground))
                            .clipShape(Capsule())
                        HStack{
                            Image(systemName:"face.smiling")
                            Spacer()
                            Image(systemName:"paperclip")
                            Image(systemName:"camera.fill")
                        }.padding(.horizontal)
                    }
                        Image(systemName:
                                vm.text.isEmpty ?
                              "mic.circle.fill" : "play.circle.fill")
                            .resizable()
                            .frame(width: 40, height: 40)
                            .foregroundStyle(Color(.darkGray))
                    
                }.padding()
               
            }
            .background(
                Image("background_image")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea(edges: .all)
                    .frame(maxWidth: .infinity,maxHeight: .infinity)
            )
            .toolbar{
                ToolbarItem(placement: .topBarLeading){
                    HStack{
                        Image(systemName: "arrow.backward")
                        HStack{
                            ProfileImageView(profileImageSize: .xxSmall, user: User.MOCK_User)
                            Text("Ömer Faruk Dikili")
                        }
                    }                    .foregroundStyle(.white)

                }
                ToolbarItem(placement: .topBarTrailing){
                    HStack(spacing:24){
                        Image(systemName: "video.fill")
                        Image(systemName: "phone.fill")
                        Image(systemName: "ellipsis")
                    }
                    .foregroundStyle(.white)
                }
            }
            .toolbarBackground(Color(.darkGray))
            .toolbarBackgroundVisibility(.visible)
        }
    }
}



#Preview {
    ChatView()
}
