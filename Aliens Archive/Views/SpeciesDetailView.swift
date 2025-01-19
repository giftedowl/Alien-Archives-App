//
//  SpeciesDetailView.swift
//  Aliens Archive
//
//  Created by John Lane on 11/30/24.
//

import SwiftUI

struct SpeciesDetailView: View {

    @EnvironmentObject
    var viewModel: SpeciesDetailViewModel

    var body: some View {
            ZStack {
                Image("BackgroundImage")
                    .resizable()
                    .ignoresSafeArea()
                VStack {
                    if let image = viewModel.speciesImage {
                        Image(uiImage: image)
                            .cornerRadius(20)
                            .padding()
                    }
                    ScrollView {
                        VStack {
                            Text(viewModel.species.name)
                                .font(.title)
                                .foregroundColor(Theme.primary.color)
                                .padding(.top)
                            Text(viewModel.species.description)
                                .foregroundColor(Theme.text.color)
                                .padding()
                        }
                        .background(
                            Theme.background.color.opacity(0.65)
                        )
                        .cornerRadius(10)
                    }
                    .background(Color.clear)
                    .padding()
                }
            }
    }
}
