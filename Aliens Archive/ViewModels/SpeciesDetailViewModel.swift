//
//  SpeciesDetailViewModel.swift
//  Aliens Archive
//
//  Created by John Lane on 12/1/24.
//

import Foundation
import SwiftUI

class SpeciesDetailViewModel: ObservableObject {
    
    @Published var error: Bool = false
    @Published var speciesMedia: SpeciesMedia?
    @Published var speciesImageData: UIImage?

    var species: Species
    private let service = Services()
    
    init(species: Species) {
        self.species = species        
    }

    func fetchSpeciesMedia() async {
        await service.fetchService(
            type: SpeciesMedia.self,
            request: .media(id: species.featured_media.description),
            completion: { result in
                DispatchQueue.main.async {
                    switch result {
                    case .success(let speciesMedia):
                        self.speciesMedia = speciesMedia
                        Task {
                            await self.fetchSpeciesData()
                        }
                    default:
                        self.error = true
                    }
                }
        })
    }

    func fetchSpeciesData() async {
        guard let speciesMedia else {
            return
        }
        await self.service.fetchData(
            type: .data(media: speciesMedia)) { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let data):
                    self.speciesImageData = UIImage(data: data)
                default:
                    self.error = true
                }
            }
        }
    }
}
