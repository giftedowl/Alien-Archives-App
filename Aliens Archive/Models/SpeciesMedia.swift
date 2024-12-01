//
//  SpeciesMedia.swift
//  Aliens Archive
//
//  Created by John Lane on 11/30/24.
//

struct SpeciesMedia: Decodable {
    let id: Int
    let source_url: String
    let media_details: MediaDetails
    
    struct MediaDetails: Decodable {
        let file: String
        let width: Int
        let height: Int
        let sizes: MediaSizes
    }

    struct MediaSizes: Decodable {
        let medium: MediaImages
//        let thumbnail: MediaImages
//        let square: MediaImages
//        let featured: MediaImages
//        let full: MediaImages
    }

    struct MediaImages: Decodable {
        let file: String
        let width: Int
        let height: Int
        let mime_type: String
        let source_url: String
    }
}
