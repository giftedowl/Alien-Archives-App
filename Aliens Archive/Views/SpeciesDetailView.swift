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
                }
                ScrollView {
                    VStack {
                        Text(viewModel.species.title)
                            .font(.title)
                            .foregroundColor(Theme.primary.color)
                        Text(viewModel.species.content)
                            .foregroundColor(Theme.text.color)
                            .padding()
                    }
                    .padding()
                    .background(
                        Theme.background.color.opacity(0.65)
                    )
                    .cornerRadius(10)
                    VStack(alignment: .leading) {
                        ForEach(
                            Characteristics.CodingKeys.allCases,
                            id:\.self
                        ) { attribute in
                            let value = attribute.from(viewModel.species.characteristics)
                            if value == "" {
                                EmptyView()
                            } else {
                                Text("\(attribute.label): \(value)")
                                    .padding(20)
                                    .background(Theme.highlight.color.opacity(0.8))
                                    .foregroundStyle(Theme.primary.color)
                                    .cornerRadius(10)
                            }
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
