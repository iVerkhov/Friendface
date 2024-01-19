//
//  DetailView.swift
//  Friendface
//
//  Created by Игорь Верхов on 19.09.2023.
//

import SwiftData
import SwiftUI

struct DetailView: View {
    
    var user: User
    
    var body: some View {
//        NavigationStack {
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
//                    HStack {
//                        Text("\(user.name),")
//                        Text("\(user.age)")
//                        Image(systemName: "circle.fill")
//                            .font(.system(size: 7))
//                            .foregroundColor(user.isActive ? .green : .gray)
//                    }
                }
            }
//        }
    }
}

#Preview {
    do {
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try ModelContainer(for: User.self, configurations: config)
        let user = User(
            id: UUID(),
            isActive: true,
            name: "John Smith",
            age: 24,
            company: "Matrix",
            email: "johnsmith@matrix.com",
            address: "Test Adress",
            about: "About John Smith",
            registered: Date.now,
            tags: ["tag 1", "tag 2", "tag 3"],
            friends: [])
        return DetailView(user: user)
            .modelContainer(container)
    } catch {
        return Text("Failed to create container: \(error.localizedDescription)")
    }
    
}
