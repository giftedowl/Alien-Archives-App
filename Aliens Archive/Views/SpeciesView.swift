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
        ZStack {
            Theme.background.color
                .ignoresSafeArea()
            NavigationView {
                List(viewModel.species) { item in
                    NavigationLink {
                        SpeciesDetailView(
                            species: item
                        )
                    } label: {
                        SpeciesItem(
                            species: item
                        )
                    }
                    .listRowBackground(
                        Theme.background.color
                    )
                }
                .background(
                    Theme.background.color
                )
                .navigationTitle("Alien Species")
            }
        }
    }
}

#Preview {
    SpeciesView()
}
