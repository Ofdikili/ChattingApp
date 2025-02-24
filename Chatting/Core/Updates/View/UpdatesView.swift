//
//  InboxView.swift
//  Chatting
//
//  Created by Ömer Faruk Dikili on 23.02.2025.
//

import SwiftUI

struct UpdatesView: View {
    @State private var searchText: String = ""
    var body: some View {
        NavigationStack{
            List{
                StatusSectionHeader()
                    .listRowBackground(Color.clear)
                StatusSection()
                Section(){
                    RecentUpdatesView()
                }header:{
                    Text("Recent Updates")
                }
                
                Section{
                    ChannelListView()
                }header: {
                    HStack{
                        Text("Channels")
                            .bold()
                            .font(.title3)
                            .textCase(nil)
                            .foregroundStyle(.whatsAppBlack)
                        Spacer()
                        Image(systemName: "plus")
                            .padding(8)
                            .background(Color(.systemGray5))
                            .clipShape(Circle())
                    }
                    .foregroundStyle(.whatsAppBlack)
                    .bold()
                }
            }
            .listStyle(.grouped)
            .navigationTitle(Text("Updates"))
            .searchable(text: $searchText)
        }
    }
}

private struct StatusSectionHeader: View {
    var body: some View {
        HStack(alignment:.top){
            Image(systemName: "circle.dashed")
                .foregroundStyle(.blue)
            Text("Use status to share photos,text and videos that dissapear in 24 hours.") +
            Text(" Status Privacy")                .foregroundStyle(.blue).bold()

            Image(systemName: "xmark")

        }.padding()
            .background(.whatsAppWhite)
            .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

private struct StatusSection : View{
    var body : some View{
        HStack(){
            Circle().frame(width: 55,height: 55)
            VStack(alignment: .leading){
                Text("My Status")
                    .font(.callout)
                    .bold()
                Text("Add to my Status")
                    .foregroundStyle(.gray)
                    .font(.system(size: 15))
               
            }
            Spacer()
            cameraButton()
            pencilButton()
        }
    }
    
    private func pencilButton() -> some View{
        Image(systemName: "pencil")
            .padding(10)
            .background(Color(.systemGray5))
            .clipShape(.circle)
            .bold()
    }
    
    private func cameraButton() -> some View{
        Image(systemName: "camera.fill")
            .padding(10)
            .background(Color(.systemGray5))
            .clipShape(.circle)
            .bold()
    }
}

private struct RecentUpdatesView : View{
    var body : some View{
        HStack(){
            Circle().frame(width: 55,height: 55)
            VStack(alignment: .leading){
                Text("Ömer Faruk Dikili")
                    .font(.callout)
                    .bold()
                Text("1h Ago")
                    .foregroundStyle(.gray)
                    .font(.system(size: 15))
               
            }
        }
    }
}

private struct ChannelListView : View {
    var body: some View {
        VStack{
            Text("Stay updates on topics that matter to you. Find channels to follow below")
                .font(.callout)
                .foregroundStyle(.gray)
                .padding(.horizontal)
            ScrollView(.horizontal,showsIndicators: false){
                HStack(){
                    ForEach(0..<10){_ in
                        SuggestedChannelItemView()
                    }
                }
            }
            
            Button("Explore More"){}
                .tint(.blue)
                .bold(true)
                .buttonStyle(.borderedProminent)
                .clipShape(Capsule())
                .padding(.vertical)
                
            
        }
    }
}

private struct SuggestedChannelItemView: View {
    var body: some View{
        VStack(spacing: 10){
            Circle()
                .frame(width: 55,height: 55)
            Text("Ankara Gücü")
                .font(.callout)
                .bold()
            Button(
                action:{},
                label:{
                    Text("Follow")
                        .bold()
                }
            )
            .frame(maxWidth:.infinity)
            .background(Color.blue.opacity(0.2))
            .clipShape(Capsule())
        }.padding(.horizontal,16)
            .padding(.vertical).overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color(.systemGray4), lineWidth: 1)
        )
    }
}

#Preview {
    UpdatesView()
}
