//
//  ChatMessageView.swift
//  Aliens Archive
//
//  Created by John Lane on 1/12/25.
//

import SwiftUI

struct ChatMessageView: View {
    let message: ChatMessage

    var body: some View {
        HStack {
            if message.role == .user {
                Spacer()
                Text(message.content)
                    .padding()
                    .background(Theme.background.color.opacity(0.7))
                    .cornerRadius(10)
                    .foregroundColor(Theme.text.color)
            } else if message.role == .assistant {
                Text(message.content)
                    .padding()
                    .background(Theme.highlight.color.opacity(0.3))
                    .cornerRadius(10)
                    .foregroundColor(Theme.text.color)
                Spacer()
            } else {
                EmptyView()
            }
        }
    }
}

