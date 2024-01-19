//
//  DetailView.swift
//  ChallengeURLSession
//
//  Created by Игорь Верхов on 19.09.2023.
//

import SwiftUI

struct DetailView: View {
    
    var user: User
    
    var body: some View {
        NavigationStack {
            List {
                Section("About") {
                        Text(user.about)
                }
                
                Section("Contact details") {
                    Text("Adress: \(user.address)")
                    Text("Company: \(user.company)")
                    Text("Email: \(user.email)")
                }
                
                Section("Friends") {
                    ForEach(user.friends) { friend in
                        Text(friend.name)
                    }
                }
                
                Section("Tags") {
                    ForEach(user.tags, id: \.self) { tag in
                        Text(tag)
                    }
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    NaviView(user: user)
                }
            }
        }
    }
}

#Preview {
    DetailView(user: .testUser)
}
