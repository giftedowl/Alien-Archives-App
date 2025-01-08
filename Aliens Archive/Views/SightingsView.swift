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
        VStack {
            List(viewModel.sightings) { sighting in
                SightingsListItemView(sighting: sighting)
                    .onTapGesture {
                        Task {
                            viewModel.updateMapRegion(sighting.coordinate)
                        }
                    }
            }
            ZStack {
                Map(coordinateRegion: $viewModel.region,
                    annotationItems: viewModel.sightings
                ) { sighting in
                    MapAnnotation(coordinate: sighting.coordinate) {
                        Image(systemName: sighting.acf.shape.iconName)
                            .foregroundStyle( Theme.highlight.color )
                    }
                }
                VStack {
                    Spacer()
                    HStack {
                        Spacer()
                        Button(action: {
                            viewModel.attemptCurrentLocation()
                        }, label: {
                            Image("location.fill")
                        })
                    }.padding()
                }.padding()
            }
        }
    }
}

struct SightingsListItemView: View {
    let sighting: Sighting

    var body: some View {
        VStack {
            Text(sighting.title.rendered)
                .font(.title)
                .lineLimit(2)
            Text("\(sighting.acf.city), \(sighting.acf.state)")
                .font(.subheadline)
                .bold()
        }
    }
}


//#Preview {
//    SightingsView()
//}
