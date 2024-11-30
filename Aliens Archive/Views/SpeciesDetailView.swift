//
//  SpeciesDetailView.swift
//  Aliens Archive
//
//  Created by John Lane on 11/30/24.
//

import SwiftUI

struct SpeciesDetailView: View {
    var species: Species

    var body: some View {
        ZStack {
            Theme.background.color
                .ignoresSafeArea()
            VStack {
                Text("Species: \(species.title.rendered)")
                    .font(.title)
                    .foregroundColor(Theme.text.color)
                    .padding()
                Text(species.content.rendered)
                    .font(.caption)
                    .foregroundColor(Theme.text.color)
                    .padding()
                Spacer()
            }
        }
    }
}

#Preview {
    SpeciesDetailView(
        species: Species(
            title: "The Grays",
            content: "Small, 3 - 4 foot aliens"
        )
    )
}
