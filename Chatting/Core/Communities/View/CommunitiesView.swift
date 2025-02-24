//
//  InboxView.swift
//  Chatting
//
//  Created by Ömer Faruk Dikili on 23.02.2025.
//

import SwiftUI

struct CommunitiesView: View {
    var body: some View {
        NavigationStack {
            ScrollView{
                VStack(alignment: .leading, spacing: 8){
                    Image("communities")
                    Group{
                        Text("Stay connected with a community")
                        Text("Communities bring members together in topic based groups. Any community you're added to will appear here.")
                            .foregroundStyle(.gray)
                    }
                    .padding(.horizontal,5)
                    Button("See Example communities>"){
                        
                    }.frame(maxWidth:.infinity,alignment: .center)
                    createNewComminityButton()
                 
                }
            }
            .navigationTitle("Communities")
        }
    }
    
    fileprivate func createNewComminityButton() -> Button<some View> {
        return Button(action: {},label: {
            Label("New Community",systemImage: "plus")
                .frame(maxWidth:.infinity)
                .padding(16)
                .background(Color.blue)
                .foregroundStyle(.white)
                .clipShape(RoundedRectangle(cornerRadius: 8))
                .padding()
        })
    }
}

#Preview {
    CommunitiesView()
}
