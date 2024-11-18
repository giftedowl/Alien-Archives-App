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
            Text(species.content.rendered)
                .font(.caption)
        }
        .padding()
        .background(
            Color.green.cornerRadius(10)
        )
    }
}

