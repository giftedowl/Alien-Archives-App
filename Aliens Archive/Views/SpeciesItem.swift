//
//  SpeciesItem.swift
//  Aliens Archive
//
//  Created by John Lane on 11/17/24.
//

import SwiftUI

struct SpeciesItem: View {
    var species: Species
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(species.title)
                .font(.title)
                .foregroundColor(Theme.primary.color)
            Text(species.excerpt)
                .font(.subheadline)
                .foregroundColor(Theme.text.color)
        }
        .padding()
    }
}
