//
//  Sighting.swift
//  Aliens Archive
//
//  Created by John Lane on 12/28/24.
//

import Foundation
import MapKit

struct Sighting: Decodable, Identifiable {
    let id: Int
    let title: Rendered
    let content: Rendered
    let link: String
    let featured_media: Int
    let acf: CustomFields

    var coordinate: CLLocationCoordinate2D {
        .init(latitude: acf.latitude, longitude: acf.longitude)
    }

    struct CustomFields: Decodable {
        let city: String // "Santa Clara",
        let state: String //"CA",
        let country: String // "USA",
        let shape: String //"Circle",
        let latitude: Double //37.3541667,
        let longitude: Double //-121.9541667
    }
}
