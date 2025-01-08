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
    private let locationManager = LocationManager()

    init() {
        region = MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: 0, longitude: 0),
            span: MKCoordinateSpan(latitudeDelta: 0.3, longitudeDelta: 0.3)
        )
        Task {
            await fetchAllSightings()
        }
    }

    func updateMapRegion(_ coordinate: CLLocationCoordinate2D) {
        region.center = coordinate
    }

    func attemptCurrentLocation() {
        if let userLocation = locationManager.userLocation {
            updateMapRegion( userLocation )
        } else {
            locationManager.requestWhenInUseAuthorization()
        }
    }

    @MainActor
    func fetchAllSightings() async {
        do {
            sightings = try await service.fetchServiceArray(
                    type: [Sighting.self],
                    request: .sighting
            )
            if let firstSighting = sightings.first {
                updateMapRegion(firstSighting.coordinate)
            }
        } catch {
            print("error")
        }
    }
}
