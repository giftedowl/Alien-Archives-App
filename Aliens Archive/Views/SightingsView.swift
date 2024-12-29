//
//  SightingsView.swift
//  Aliens Archive
//
//  Created by John Lane on 12/28/24.
//

import SwiftUI
import MapKit

struct SightingsView: View {
    @StateObject
    private var viewModel = SightingsViewModel()

    var body: some View {
        Map(coordinateRegion: $viewModel.region, annotationItems: viewModel.sightings) { sighting in
            MapPin(coordinate: sighting.coordinate)
        }
    }
}

//#Preview {
//    SightingsView()
//}
