//
//  Friendface.swift
//  Friendface
//
//  Created by Игорь Верхов on 18.09.2023.
//

import SwiftData
import SwiftUI

@main
struct FriendfaceApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: User.self)
    }
}
