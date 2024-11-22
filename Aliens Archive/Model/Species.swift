//
//  Species.swift
//  Aliens Archive
//
//  Created by John Lane on 11/17/24.
//

import Foundation

struct Species: Decodable, Identifiable {
    let id: Int
    let title: Rendered
    let content: Rendered
    let excerpt: Rendered
    let link: String
    let featured_media: Int

    struct Rendered: Decodable {
        let rendered: String
    }
}
