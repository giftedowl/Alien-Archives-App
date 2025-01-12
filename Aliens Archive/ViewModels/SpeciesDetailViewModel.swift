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
    @Published var messages: [ChatMessage] = []

    var species: Species

    private let service = Services()
    
    init(species: Species) {
        self.species = species
        print("Prompt: \(species.prompt)")
        self.messages = [ChatMessage(content: species.prompt, role: .system)]
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
    func fetchAlienResponse(with species: Species) async {
        do {
            let chatResponse = try await service.fetchService(
                type: ChatGPTResponse.self,
                request: .message(request: ChatGPTRequest(messages: messages))
            )
            guard let response = chatResponse.choices.first?.message.content else {
                print("ChatGPT Error: \(error)")
                return
            }
            messages.append(
                ChatMessage(content: response, role: .assistant)
            )
        } catch let error {
            print("ChatGPT Error: \(error)")
        }
    }
}


