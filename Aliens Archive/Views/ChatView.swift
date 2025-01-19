//
//  ChatView.swift
//  Aliens Archive
//
//  Created by John Lane on 1/12/25.
//

import SwiftUI

struct ChatView: View {

    @EnvironmentObject
    public var viewModel: SpeciesDetailViewModel

    @State 
    private var userInput: String = ""

    var body: some View {
        ZStack {
            Theme.background.color
            VStack {
                Text("You are chatting with \(viewModel.species.name)")
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
                        .border(Theme.primary.color, width: 2)
                        .padding(10)
                        .foregroundStyle(Theme.primary.color)
                    Button(action: sendMessage) {
                        Text("Send")
                            .padding(10)
                            .foregroundStyle(Theme.primary.color)
                            .bold()
                    }
                    .border(Theme.primary.color, width: 2)
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
        let message = userInput
        Task {
            await viewModel
                .send(message: message)
        }
        userInput = ""
    }
}
