//
//  User.swift
//  Friendface
//
//  Created by Игорь Верхов on 18.09.2023.
//

import Foundation

struct User: Codable, Hashable, Identifiable {
    let id: UUID
    let isActive: Bool
    let name: String
    let age: Int
    let company: String
    let email: String
    let address: String
    let about: String
    let registered: Date
    let tags: [String]
    let friends: [Friend]
    
    static let testUser = User(
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
        friends: [Friend.testFriend])
}
