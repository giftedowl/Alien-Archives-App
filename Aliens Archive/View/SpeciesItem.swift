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
            Text(species.content.rendered)
        }
    }
}

#Preview {
    SpeciesItem(species:
        Species(
            title: "The Grays",
            content: "Small, 3 - 4 foot aliens"
        )
    )
}
