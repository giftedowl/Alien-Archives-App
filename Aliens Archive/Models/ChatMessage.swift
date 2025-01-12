//
//  ChatMessage.swift
//  Aliens Archive
//
//  Created by John Lane on 1/12/25.
//

import Foundation

struct ChatMessage: Identifiable {
    let id = UUID()
    let text: String
    let isUser: Bool

    static var error: ChatMessage {
        .init(text: "Sorry, I don't understand.", isUser: false)
    }
}
