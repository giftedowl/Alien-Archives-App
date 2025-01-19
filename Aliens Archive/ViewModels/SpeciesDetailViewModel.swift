//
//  SpeciesDetailViewModel.swift
//  Aliens Archive
//
//  Created by John Lane on 12/1/24.
//

import Foundation
import SwiftUI

class SpeciesDetailViewModel: ObservableObject, Observable, Toastable {

    @Published var messages: [ChatMessage] = []
    @Published var speciesImage: UIImage?

    var species: Species
    var toast: ToastViewModel

    private let service = JsonService()
    
    init(species: Species) {
        self.species = species
        self.messages = [ChatMessage(content: species.prompt, role: .system)]

        self.toast = ToastViewModel()
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
        } catch  {
            toast.show(message: "Unable to load species media")
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
            speciesImage = UIImage(data: imageData)
        } catch {
            toast.show(message: "Unable to load species image")
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
                messages.append(
                    ChatMessage(
                        content: "Sorry, I'm having trouble with my service",
                        role: .assistant
                    )
                )
                return
            }
            messages.append(
                ChatMessage(content: response, role: .assistant)
            )
        } catch {
            messages.append(
                ChatMessage(
                    content: "Sorry, I'm having trouble with my service",
                    role: .assistant
                )
            )
        }
    }
}


