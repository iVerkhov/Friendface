//
//  Friendface.swift
//  Friendface
//
//  Created by Игорь Верхов on 18.09.2023.
//

import SwiftUI

struct ContentView: View {
    
    @State private var users = [User]()
    
    var body: some View {
        NavigationStack {
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
            .navigationDestination(for: User.self) { user in
                DetailView(user: user)
        }
            }
            .task {
                await loadData()
            }
            .navigationTitle("Friendface")
            
    }
    
    func loadData() async {
        // Don't re-fetch data if we already have it
        guard users.isEmpty else { return }
        
        guard let url = URL(string: "https://www.hackingwithswift.com/samples/friendface.json") else { print("Invalid Url")
            return
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601
            
            users = try decoder.decode([User].self, from: data)
        } catch {
            print("Invalid data")
        }
    }
}

#Preview {
    ContentView()
}
