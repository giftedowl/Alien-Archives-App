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
        ZStack {
            Theme.background.color
            VStack {
                Text("Ask Me Anything")
                    .font(.headline)
                    .foregroundStyle(Theme.primary.color)
                    .padding()
                ScrollViewReader { scrollViewProxy in
                    ScrollView {
                        ForEach(viewModel.messages) { message in
                            ChatMessageView(message: message)
                                .padding(.horizontal)
                        }
                    }
                    .padding()
                    .onChange(of: viewModel.messages) { _ in
                        if let lastMessage = viewModel.messages.last {
                            scrollViewProxy
                                .scrollTo(lastMessage.id, anchor: .bottom)
                        }
                    }
                }

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
            .padding()

        }
    }

    func sendMessage() {
        guard !userInput.isEmpty else {
            return
        }

        let userMessage = ChatMessage(content: userInput, role: .user)
        viewModel.messages.append(userMessage)
        userInput = ""

        Task {
            await viewModel
                .fetchAlienResponse(
                    with: viewModel.species
                )
        }
    }
}
