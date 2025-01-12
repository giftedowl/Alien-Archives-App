//
//  ChatGPTResponse.swift
//  Aliens Archive
//
//  Created by John Lane on 1/12/25.
//
import Foundation

struct ChatGPTResponse: Decodable {
    let choices: [Choice]

    struct Choice: Decodable {
        let message: MessageContent

        struct MessageContent: Decodable {
            let content: String
        }
    }
}
