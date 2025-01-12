//
//  ChatView.swift
//  Aliens Archive
//
//  Created by John Lane on 1/12/25.
//

import SwiftUI

struct Message: Identifiable {
    let id = UUID()
    let text: String
    let isUser: Bool
}

struct ChatView: View {
    @State private var messages: [Message] = []
    @State private var userInput: String = ""

    var body: some View {
        VStack {
            Text("Let's Chat")
                .font(.subheadline)
                .padding()
            ScrollView {
                ForEach(messages) { message in
                    HStack {
                        if message.isUser {
                            Spacer()
                            Text(message.text)
                                .padding()
                                .background(Theme.background.color.opacity(0.7))
                                .cornerRadius(10)
                                .foregroundColor(Theme.text.color)
                        } else {
                            Text(message.text)
                                .padding()
                                .background(Theme.background.color.opacity(0.3))
                                .cornerRadius(10)
                                .foregroundColor(Theme.secondary.color)
                            Spacer()
                        }
                    }
                    .padding(.horizontal)
                }
            }
            .padding()

            HStack {
                TextField("Type your message", text: $userInput)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                Button(action: sendMessage) {
                    Text("Send")
                }
                .padding()
            }
            .padding()
        }
    }

    func sendMessage() {
        let userMessage = Message(text: userInput, isUser: true)
        messages.append(userMessage)
        userInput = ""

        // Simulate API response
//        fetchAlienResponse(for: userMessage.text)
    }
}
