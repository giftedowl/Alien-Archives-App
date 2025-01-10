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

    @MainActor
    func fetchSpeciesMedia() async {
        do {
            speciesMedia = try await service.fetchService(
                type: SpeciesMedia.self,
                request: .media(id: species.featuredMedia.description)
            )
            await fetchSpeciesData()
        } catch {
            print("error")
        }
    }

    @MainActor
    func fetchSpeciesData() async {
        guard let speciesMedia else {
            return
        }
        do {
            let imageData = try await service.fetchData(
                request: .data(media: speciesMedia)
            )
            self.speciesImageData = UIImage(data: imageData)
        } catch {
            print("error")
        }
    }
}
