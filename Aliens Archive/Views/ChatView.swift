//
//  ChatView.swift
//  Aliens Archive
//
//  Created by John Lane on 1/12/25.
//

import SwiftUI


struct ChatView: View {

    @ObservedObject
    public var viewModel: SpeciesDetailViewModel

    @State private var userInput: String = ""

    var body: some View {
        ZStack {
            Theme.background.color
            VStack {
                Text("Ask Me Anything")
                    .font(.headline)
                    .foregroundStyle(Theme.primary.color)
                ScrollViewReader { scrollViewProxy in
                    ScrollView {
                        ForEach(viewModel.messages) { message in
                            ChatMessageView(message: message)
                        }
                    }
                    .onChange(of: viewModel.messages) { _ in
                        if let lastMessage = viewModel.messages.last {
                            scrollViewProxy
                                .scrollTo(lastMessage.id, anchor: .bottom)
                        }
                    }
                }

                HStack {
                    TextField("Ask me anything...", text: $userInput)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    Button(action: sendMessage) {
                        Text("Send")
                            .padding()
                            .cornerRadius(10)
                    }
                    .background(Theme.highlight.color)
                }
            }
            .padding()

        }
    }

    @MainActor
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
