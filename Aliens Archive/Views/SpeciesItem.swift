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
            Text(species.title)
                .font(.title)
                .foregroundColor(Theme.text.color)
            Text(species.excerpt)
                .font(.caption)
                .foregroundColor(Theme.text.color)
        }
        .padding()
        .background(
            Theme
                .primary
                .color
                .opacity(0.35)
                .cornerRadius(10)
        )
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Theme.primary.color, lineWidth: 3)
        )
    }
}

