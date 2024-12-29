//
//  SightingsView.swift
//  Aliens Archive
//
//  Created by John Lane on 12/28/24.
//

import SwiftUI

struct SightingsView: View {
    @StateObject
    private var viewModel = SightingsViewModel()
    var body: some View {
        VStack {
            ForEach(viewModel.sightings) { sighting in
                Text(sighting.title.rendered)
            }
        }
    }
}

//#Preview {
//    SightingsView()
//}
