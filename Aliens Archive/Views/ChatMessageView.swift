//
//  ChatMessageView.swift
//  Aliens Archive
//
//  Created by John Lane on 1/12/25.
//

import SwiftUI

struct ChatMessageView: View {

    @EnvironmentObject
    public var viewModel: SpeciesDetailViewModel

    let message: ChatMessage

    var body: some View {
        HStack(alignment: .top) {
            if message.role == .user {
                Spacer()
                Text(message.content)
                    .padding()
                    .background(Theme.secondary.color.opacity(0.3))
                    .cornerRadius(10)
                    .foregroundColor(Theme.text.color)
                    .font(.caption)
            } else if message.role == .assistant {
                if let image = viewModel.speciesImage {
                    VStack {
                        Image(uiImage: image)
                            .resizable()
                            .cornerRadius(5)
                            .padding()
                            .frame(width: 80, height: 80)
                        Text(viewModel.species.name)
                            .foregroundStyle(Theme.primary.color)
                            .font(.caption)
                    }
                }
                Text(message.content)
                    .padding()
                    .background(Theme.highlight.color.opacity(0.3))
                    .cornerRadius(10)
                    .foregroundColor(Theme.text.color)
                    .font(.caption)
                Spacer()
            } else {
                EmptyView()
            }
        }
    }
}

