//
//  SightingsViewModel.swift
//  Aliens Archive
//
//  Created by John Lane on 11/17/24.
//

import Foundation

class SightingsViewModel: ObservableObject {
    
    @Published var sightings: [Sighting] = []
    @Published var error: Bool = false
    private let service = Services()

    init() {
        Task {
            await fetchAllSightings()
        }
    }

    func fetchAllSightings() async {
        await service.fetchService(type: [Sighting.self], request: .sighting, completion: { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let sightings):
                    self.sightings = sightings
                    print("sightings \(sightings)")
                default:
                    self.error = true
                }
            }
        })
    }
}
