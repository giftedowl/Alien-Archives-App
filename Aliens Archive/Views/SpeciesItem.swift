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
        VStack {
            Text(species.title.rendered)
                .font(.title)
                .foregroundColor(Theme.text.color)
            Text(species.content.rendered)
                .font(.caption)
                .foregroundColor(Theme.text.color)
        }
        .padding()
        .background(
            Theme.primary.color.cornerRadius(10)
        )
    }
}

