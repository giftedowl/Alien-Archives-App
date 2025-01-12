//
//  Species.swift
//  Aliens Archive
//
//  Created by John Lane on 11/17/24.
//

import Foundation

struct Species: Decodable, Identifiable {
    let id: Int
    let title: String
    let content: String
    let excerpt: String
    let link: String
    let featuredMedia: Int

    let traits: PhysicalTraits
    let capabilities: Capabilities

    var activeTraits: [PhysicalTraits.CodingKeys] {
        return PhysicalTraits.CodingKeys.allCases.compactMap { key in
            return traits.value(for: key).isEmpty ? nil : key
        }
    }

    var speciesMedia: SpeciesMedia?

    init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(Int.self, forKey: .id)
        let titleRendered = try container.decode(Rendered.self, forKey: .title)
        self.title = titleRendered.rendered
        let contentRendered = try container.decode(Rendered.self, forKey: .content)
        self.content = contentRendered.rendered.htmlDecoded
        let excerptRendered = try container.decode(Rendered.self, forKey: .excerpt)
        self.excerpt = excerptRendered.rendered.htmlDecoded
        self.link = try container.decode(String.self, forKey: .link)
        self.featuredMedia = try container
            .decode(Int.self, forKey: .featuredMedia)

        self.traits = try container
            .decode(PhysicalTraits.self, forKey: .acf)
        self.capabilities = try container
            .decode(Capabilities.self, forKey: .acf)
    }

    enum CodingKeys: String, CodingKey, Decodable {
        case id
        case title
        case content
        case excerpt
        case link
        case acf
        case featuredMedia = "featured_media"
    }

    mutating func setMedia(media: SpeciesMedia) {
        self.speciesMedia = media
    }
}
