//
//  Species.swift
//  Aliens Archive
//
//  Created by John Lane on 11/17/24.
//

import Foundation

struct Species: Decodable, Identifiable {
    let id: UUID
    let title: Rendered
    let content: Rendered
    let excerpt: Rendered
    let link: String
    let featured_media: Int

    init(
        title: String,
        content: String
    ) {
        id = UUID()
        link = ""
        featured_media = 0
        self.title = Rendered(rendered: title)
        self.content = Rendered(rendered: content)
        self.excerpt = Rendered(rendered: content)
    }

    struct Rendered: Decodable {
        let rendered: String
    }
}
