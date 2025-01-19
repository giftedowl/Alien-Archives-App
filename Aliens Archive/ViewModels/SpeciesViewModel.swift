//
//  SpeciesViewModel.swift
//  Aliens Archive
//
//  Created by John Lane on 11/17/24.
//

import Foundation

final class SpeciesViewModel: ObservableObject, Toastable {

    @Published var species: [Species] = []

    var toast: ToastViewModel

    let service: Serviceable

    init(service: Serviceable) {
        self.service = service
        toast = ToastViewModel()
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
        } catch {
            toast.show(message: "Unable to load species list")
        }
    }
}
