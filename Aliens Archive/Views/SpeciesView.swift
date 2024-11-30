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
            Theme.background.color.ignoresSafeArea()
            List(viewModel.species) { item in
                SpeciesItem(
                    species: item
                )
                .listRowBackground(
                    Theme.background.color
                )
            }
        }
    }
}

#Preview {
    SpeciesView()
}
