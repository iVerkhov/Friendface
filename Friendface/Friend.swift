//
//  Friend.swift
//  Friendface
//
//  Created by Игорь Верхов on 18.09.2023.
//

import Foundation
import SwiftData

@Model
class Friend: Codable {
    
    enum CodingKeys: CodingKey {
        case id
        case name
    }
    
    let id: UUID
    let name: String
    
    static let testFriend = Friend(id: UUID(), name: "Neo")
    
    init(id: UUID, name: String) {
        self.id = id
        self.name = name
    }
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(UUID.self, forKey: .id)
        self.name = try container.decode(String.self, forKey: .name)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.name, forKey: .name)
    }
}
