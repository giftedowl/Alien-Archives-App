//
//  SpeciesViewModel.swift
//  Aliens Archive
//
//  Created by John Lane on 11/17/24.
//

import Foundation

class SpeciesViewModel: ObservableObject {
    
    @Published var species: [Species] = []
    @Published var error: Bool = false
    private let service = Services()

    init() {
        Task {
            await fetchAllSpecies()
        }
    }

    func fetchAllSpecies() async {
        await service.fetchService(type: [Species.self], request: .species, completion: { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let species):
                    self.species = species
                default:
                    self.error = true
                }
            }
        })
    }
}
