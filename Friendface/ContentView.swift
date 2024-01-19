//
//  Friendface.swift
//  Friendface
//
//  Created by Игорь Верхов on 18.09.2023.
//

import SwiftData
import SwiftUI


struct ContentView: View {
    @Environment(\.modelContext) var modelContext
    @Query(sort: \User.name) private var users: [User]
    
    var body: some View {
        NavigationStack {
            Text(String(users.count))
            List {
                ForEach(users) { user in
                    NavigationLink(value: user) {
                        HStack {
                            Text(user.name)
                            Circle()
                                .frame(width: 7)
                                .foregroundColor(user.isActive ? .green : .gray)
                        }
                    }
                    
                }
            }
            .navigationTitle("Friendface")
            .navigationDestination(for: User.self) { user in
                DetailView(user: user)
            }
            .toolbar {
                Button("Reload") {
                    try? modelContext.delete(model: User.self)
                    Task {
                        await loadData()
                    }
                }
            }
        }
//        .task {
//            await loadData()
//        }
        
        
        
    }
    
    func loadData() async {
        // Don't re-fetch data if we already have it
        guard users.isEmpty else { 
            print("Not empty")
            return }
        
        print("Empty")
        guard let url = URL(string: "https://www.hackingwithswift.com/samples/friendface.json") else { print("Invalid Url")
            return
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601
            
            let fetchedUsers = try decoder.decode([User].self, from: data)
//            let inserContext = ModelContext(modelContext.container)
            
            for user in fetchedUsers {
                modelContext.insert(user)
            }
//            try inserContext.save()
        } catch {
            print("Invalid data")
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: User.self)
}
