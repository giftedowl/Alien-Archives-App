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
            Theme.background.color
                .ignoresSafeArea()
            VStack {
                if let image = viewModel.speciesImageData {
                    Image(uiImage: image)
                }
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
                    await viewModel.fetchSpeciesMedia()
                }
            }
        }
    }
}

