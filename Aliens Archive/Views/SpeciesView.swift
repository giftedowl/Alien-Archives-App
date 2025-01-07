//
//  SpeciesView.swift
//  Aliens Archive
//
//  Created by John Lane on 11/18/24.
//

import SwiftUI

struct SpeciesView: View {

    @StateObject
    private var viewModel = SpeciesViewModel()

    var body: some View {
        NavigationView {
            List(viewModel.species) { item in
                NavigationLink {
                    SpeciesDetailView(
                        viewModel: SpeciesDetailViewModel(species: item)
                    )
                } label: {
                    SpeciesItem(
                        species: item
                    )
                }
            }
            .navigationTitle("Alien Species")
        }
    }
}

