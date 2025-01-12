//
//  ChatView.swift
//  Aliens Archive
//
//  Created by John Lane on 1/12/25.
//

import SwiftUI


struct ChatView: View {

    public let viewModel: SpeciesDetailViewModel

    @State private var userInput: String = ""

    var body: some View {
        VStack {
            Text("Chat with me")
                .font(.subheadline)
                .padding()
            ScrollView {
                ForEach(viewModel.messages) { message in
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
        guard !userInput.isEmpty else {
            return
        }

        let userMessage = ChatMessage(text: userInput, isUser: true)
        viewModel.messages.append(userMessage)
        userInput = ""

        Task {
            await viewModel
                .fetchAlienResponse(
                    with: viewModel.species,
                    message: userMessage.text
                )
        }
    }
}
