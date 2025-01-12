//
//  SpeciesViewModel.swift
//  Aliens Archive
//
//  Created by John Lane on 11/17/24.
//

import Foundation

final class SpeciesViewModel: ObservableObject {

    @Published var species: [Species] = []
    @Published var error: Bool = false
    private let service = Services()

    init() {
        Task {
            await fetchAllSpecies()
        }
    }

    @MainActor
    func fetchAllSpecies() async {
        do {
            species = try await service.fetchServiceArray(
                    type: [Species.self],
                    request: .species
            )
            print("Species: \(species)")
        } catch let error {
            print("Error Decoding Species: \(error)")
        }
    }
}
