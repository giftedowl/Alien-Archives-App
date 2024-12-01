//
//  SpeciesDetailView.swift
//  Aliens Archive
//
//  Created by John Lane on 11/30/24.
//

import SwiftUI

struct SpeciesDetailView: View {
    var viewModel: SpeciesDetailViewModel

    var body: some View {
        ZStack {
            Theme.background.color
                .ignoresSafeArea()
            VStack {
                Text("Species: \(viewModel.species.title.rendered)")
                    .font(.title)
                    .foregroundColor(Theme.text.color)
                    .padding()
                Text(viewModel.species.content.rendered)
                    .font(.caption)
                    .foregroundColor(Theme.text.color)
                    .padding()
                Spacer()
            }
            .onAppear {
                Task {
                    await viewModel.getSpeciesMedia()
                }
            }
        }
    }
}

