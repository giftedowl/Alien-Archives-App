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
        species = []
    }
}
