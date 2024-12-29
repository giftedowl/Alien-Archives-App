//
//  Sighting.swift
//  Aliens Archive
//
//  Created by John Lane on 12/28/24.
//

import Foundation

struct Sighting: Decodable, Identifiable {
    let id: Int
    let title: Rendered
    let content: Rendered
    let link: String
    let featured_media: Int
}
