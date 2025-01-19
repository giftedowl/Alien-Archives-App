//
//  SpeciesTabView.swift
//  Aliens Archive
//
//  Created by John Lane on 1/18/25.
//

import SwiftUI

struct SpeciesTabView: View {

    @StateObject
    var viewModel: SpeciesDetailViewModel

    var body: some View {
        TabView {
            SpeciesDetailView()
                .environment(viewModel)
                .tabItem {
                    Label {
                        Text("Info")
                    } icon: {
                        Image(systemName: "person.fill")
                    }
                }
            ChatView()
                .environment(viewModel)
                .tabItem {
                    Label {
                        Text("Chat")
                    } icon: {
                        Image(systemName: "bubble.fill")
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

