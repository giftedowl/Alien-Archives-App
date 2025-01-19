//
//  Species.swift
//  Aliens Archive
//
//  Created by John Lane on 11/17/24.
//

import SwiftUI

struct Species: Decodable, Identifiable, Promptable {
    enum CodingKeys: String, CodingKey, Decodable {
        case id
        case name = "title"
        case description = "content"
        case excerpt
        case acf
        case featuredMedia = "featured_media"
    }

    let id: Int
    let name: String
    let description: String
    let excerpt: String

    let featuredMedia: Int

    let physical: Physical
    let abilities: Abilities
    let personality: Personality
    let culture: Cultural

    var speciesMedia: SpeciesMedia?

    init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(Int.self, forKey: .id)
        let titleRendered = try container.decode(Rendered.self, forKey: .name)
        self.name = titleRendered.rendered
        let contentRendered = try container.decode(
            Rendered.self,
            forKey: .description
        )
        self.description = contentRendered.rendered.htmlDecoded
        let excerptRendered = try container.decode(Rendered.self, forKey: .excerpt)
        self.excerpt = excerptRendered.rendered.htmlDecoded

        self.physical = try container
            .decode(Physical.self, forKey: .acf)
        self.abilities = try container
            .decode(Abilities.self, forKey: .acf)
        self.personality = try container
            .decode(Personality.self, forKey: .acf)
        self.culture = try container
            .decode(Cultural.self, forKey: .acf)

        self.featuredMedia = try container
            .decode(Int.self, forKey: .featuredMedia)
    }

    mutating func setMedia(_ media: SpeciesMedia) {
        self.speciesMedia = media
    }

    var prompt: String {
        return "You are \(name), \(excerpt). \(physical.prompt) \(culture.prompt) \(personality.prompt)."
    }
}
