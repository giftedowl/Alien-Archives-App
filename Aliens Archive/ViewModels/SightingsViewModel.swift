//
//  SightingsViewModel.swift
//  Aliens Archive
//
//  Created by John Lane on 11/17/24.
//

import Foundation
import MapKit

class SightingsViewModel: ObservableObject {
    
    @Published var sightings: [Sighting] = []
    @Published var error: Bool = false
    @Published var region: MKCoordinateRegion

    private let service = Services()

    init() {
        region = MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: 37.3541667, longitude: -121.9541667), // San Francisco, CA
            span: MKCoordinateSpan(latitudeDelta: 0.3, longitudeDelta: 0.3)
        )
        Task {
            await fetchAllSightings()
        }
    }

    func updateMapRegion(sighting: Sighting) {
        region.center = CLLocationCoordinate2D(
            latitude: sighting.acf.latitude,
            longitude: sighting.acf.longitude
        )
    }

    func fetchAllSightings() async {
        await service.fetchService(type: [Sighting.self], request: .sighting, completion: { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let sightings):
                    self.sightings = sightings
                    if let firstSighting = sightings.first {
                        self.updateMapRegion(sighting: firstSighting)
                    }
                default:
                    self.error = true
                }
            }
        })
    }
}
