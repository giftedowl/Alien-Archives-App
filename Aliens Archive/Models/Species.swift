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
    
    var speciesMedia: SpeciesMedia?
    
    init(title: String, content: String) {
        id = 0
        self.title = Rendered(rendered: title)
        self.content = Rendered(rendered: content)
        self.excerpt = Rendered(rendered: content)
        self.link = ""
        featured_media = 0
    }

    struct Rendered: Decodable {
        let rendered: String
    }
    
    mutating func setMedia(media: SpeciesMedia) {
        self.speciesMedia = media
    }
}

extension String {
    var htmlDecoded: String {
        var decodedString = self
        if let data = self.data(using: .utf8) {
            let options: [NSAttributedString.DocumentReadingOptionKey: Any] = [
                .documentType: NSAttributedString.DocumentType.html,
                .characterEncoding: String.Encoding.utf8.rawValue
            ]
            do {
                let attributedString = try NSAttributedString(data: data, options: options, documentAttributes: nil)
                decodedString = attributedString.string
            } catch {}
        }
        return decodedString
    }
}
