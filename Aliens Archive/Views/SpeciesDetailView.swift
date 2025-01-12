//
//  SpeciesDetailView.swift
//  Aliens Archive
//
//  Created by John Lane on 11/30/24.
//

import SwiftUI

struct SpeciesDetailView: View {
    @StateObject var viewModel: SpeciesDetailViewModel

    var body: some View {
        ZStack {
            Image("BackgroundImage")
                .resizable()
                .ignoresSafeArea()
            VStack {
                if let image = viewModel.speciesImageData {
                    Image(uiImage: image)
                        .cornerRadius(20)
                        .padding()
                }
                TabView {
                    ScrollView {
                        VStack {
                            Text(viewModel.species.title)
                                .font(.title)
                                .foregroundColor(Theme.primary.color)
                            Text(viewModel.species.content)
                                .foregroundColor(Theme.text.color)
                                .padding()
                            PromptView(species: viewModel.species)
                        }
                        .padding()
                        .background(
                            Theme.background.color.opacity(0.65)
                        )
                        .cornerRadius(10)
                    }
                    .tabItem {
                        Label {
                            Text("Info")
                        } icon: {
                            Image(systemName: "person.fill")
                        }

                    }
                    ChatView(viewModel: viewModel)
                        .tabItem {
                            Label {
                                Text("Chat")
                            } icon: {
                                Image(systemName: "bubble.fill")
                            }
                        }
                }
            }
            .onAppear {
                Task {
                    await viewModel.fetchSpeciesMedia()
                }
            }
        }
    }
}
