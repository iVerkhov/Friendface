//
//  Friend.swift
//  ChallengeURLSession
//
//  Created by Игорь Верхов on 18.09.2023.
//

import Foundation

struct Friend: Codable, Hashable, Identifiable {
    let id: UUID
    let name: String
    
    static let testFriend = Friend(id: UUID(), name: "Neo")
}
