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
    @Published var speciesImageData: UIImage?
    @Published var messages: [Message] = []

    var species: Species

    private let service = Services()
    
    init(species: Species) {
        self.species = species        
    }

    @MainActor
    func fetchSpeciesMedia() async {
        do {
            let speciesMedia = try await service.fetchService(
                type: SpeciesMedia.self,
                request: .media(id: species.featuredMedia.description)
            )
            species.setMedia(speciesMedia)
            await fetchSpeciesData()
        } catch let error {
            print("Fetch Species Media Error: \(error)")
        }
    }

    @MainActor
    func fetchSpeciesData() async {
        guard let media = species.speciesMedia else {
            return
        }
        do {
            let imageData = try await service.fetchData(
                request: .data(media: media)
            )
            self.speciesImageData = UIImage(data: imageData)
        } catch let error {
            print("Fetch Species Data Error: \(error)")
        }
    }

    @MainActor
    func fetchAlienResponse(with: Species, message: String) async {
        do {
            let chatResponse = try await service.fetchService(
                type: ChatGPTResponse.self,
                request: .message(context: "You are an alien", message: message)
            )
            guard let response = chatResponse.choices.first?.message.content else {
                messages.append(Message.error)
                return
            }
            messages.append(
                Message(text: response, isUser: false)
            )
        } catch let error {
            messages.append(Message.error)
            print("ChatGPT Error: \(error)")
        }
    }
}


