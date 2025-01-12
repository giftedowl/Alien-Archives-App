//
//  Species.swift
//  Aliens Archive
//
//  Created by John Lane on 11/17/24.
//

import Foundation

struct Species: Decodable, Identifiable, Promptable {
    enum CodingKeys: String, CodingKey, Decodable {
        case id
        case title
        case content
        case excerpt
        case link
        case acf
        case featuredMedia = "featured_media"
    }

    let id: Int
    let title: String
    let content: String
    let excerpt: String
    let link: String
    let featuredMedia: Int

    let physical: Physical
    let culture: Cultural
    let personality: Personality

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

        self.physical = try container
            .decode(Physical.self, forKey: .acf)
        self.culture = try container
            .decode(Cultural.self, forKey: .acf)
        self.personality = try container
            .decode(Personality.self, forKey: .acf)

        self.featuredMedia = try container
            .decode(Int.self, forKey: .featuredMedia)
    }

    mutating func setMedia(_ media: SpeciesMedia) {
        self.speciesMedia = media
    }

    var prompt: String {
        return "You are \(title), \(excerpt). \(physical.prompt) \(culture.prompt) \(personality.prompt)."
    }
}
