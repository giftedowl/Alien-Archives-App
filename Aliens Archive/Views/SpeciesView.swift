//
//  SpeciesView.swift
//  Aliens Archive
//
//  Created by John Lane on 11/18/24.
//

import SwiftUI

struct SpeciesView: View {

    @StateObject
    private var viewModel = SpeciesViewModel(service: JsonService())

    var body: some View {
        NavigationView {
            ZStack(alignment: .top) {
                List(viewModel.species) { item in
                    NavigationLink {
                        SpeciesTabView(
                            viewModel: SpeciesDetailViewModel(
                                species: item
                            )
                        )
                    } label: {
                        SpeciesItem(
                            viewModel: SpeciesDetailViewModel(
                                species: item
                            )
                        )
                    }
                    .listRowBackground(Theme.background.color)
                }
                ToastView(toast: viewModel.toast)
            }
            .navigationTitle("Alien Species")
        }
    }
}

