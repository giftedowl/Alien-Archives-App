//
//  SpeciesViewModel.swift
//  Aliens Archive
//
//  Created by John Lane on 11/17/24.
//

import Foundation

class SpeciesViewModel: ObservableObject {
    
    @Published var species: [Species]
    
    init() {
        species = [
            Species(
                title: "The Grays",
                content: "Small, 3 - 4 foot aliens"
            ),
            Species(
                title: "The Grays",
                content: "Small, 3 - 4 foot aliens"
            )
        ]
    }
}
