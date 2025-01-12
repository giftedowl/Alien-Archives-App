//
//  ChatMessage.swift
//  Aliens Archive
//
//  Created by John Lane on 1/12/25.
//

import Foundation

struct ChatMessage: Codable, Identifiable, Equatable {
    let id = UUID()
    let content: String
    let role: Role

    enum Role: String, Codable {
        case system
        case user
        case assistant
    }
}
