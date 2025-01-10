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
                        .cornerRadius(20)
                }
                Text(viewModel.species.title)
                    .font(.title)
                    .foregroundColor(Theme.primary.color)
                Text(viewModel.species.content)
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
