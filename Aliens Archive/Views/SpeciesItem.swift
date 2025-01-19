//
//  SpeciesItem.swift
//  Aliens Archive
//
//  Created by John Lane on 11/17/24.
//

import SwiftUI

struct SpeciesItem: View {

    @StateObject
    var viewModel: SpeciesDetailViewModel

    var body: some View {
        VStack(alignment: .leading) {
            Text(viewModel.species.name)
                .font(.title)
                .foregroundColor(Theme.primary.color)
            Text(viewModel.species.excerpt)
                .font(.subheadline)
                .foregroundColor(Theme.text.color)
        }
        .padding()
    }
}
