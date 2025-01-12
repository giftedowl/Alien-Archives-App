//
//  ChatGPTRequest.swift
//  Aliens Archive
//
//  Created by John Lane on 1/12/25.
//


struct ChatGPTRequest: Encodable {
    let model = "gpt-4"
    let messages: [ChatMessage]
}
