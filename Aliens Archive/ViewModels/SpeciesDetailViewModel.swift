//
//  SpeciesDetailViewModel.swift
//  Aliens Archive
//
//  Created by John Lane on 12/1/24.
//

import Foundation

class SpeciesDetailViewModel: ObservableObject {
    
    @Published var error: Bool = false
    @Published var speciesMedia: SpeciesMedia?

    var species: Species
    private let service = Services()
    
    init(species: Species) {
        self.species = species        
    }

    func getSpeciesMedia() async {
        await service.fetchService(
            type: SpeciesMedia.self,
            request: .media(id: species.featured_media.description),
            completion: { result in
                DispatchQueue.main.async {
                switch result {
                case .success(let speciesMedia):
                    self.speciesMedia = speciesMedia
                default:
                    self.error = true
                }
            }
        })
    }
}
