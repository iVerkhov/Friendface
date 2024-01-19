//
//  NaviView.swift
//  Friendface
//
//  Created by Игорь Верхов on 19.09.2023.
//

import SwiftData
import SwiftUI

struct NaviView: View {
    var user: User
    
    var body: some View {
        HStack {
            Text("\(user.name),")
            Text("\(user.age)")
            Image(systemName: "circle.fill")
                .font(.system(size: 7))
                .foregroundColor(user.isActive ? .green : .gray)
        }
    }
}

#Preview {
    do {
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try ModelContainer(for: User.self, configurations: config)
        return NaviView(user: .testUser)
            .modelContainer(container)
    } catch {
        return Text("Failed to create container: \(error.localizedDescription)")
    }
}
