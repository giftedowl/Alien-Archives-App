//
//  AliensArchive.swift
//  Aliens Archive
//
//  Created by John Lane on 11/16/24.
//

import SwiftUI

@main
struct AliensArchive: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

struct ContentView: View {
    var body: some View {
        SpeciesItem(species:
            Species(
                title: "The Grays",
                content: "Small, 3 - 4 foot aliens"
            )
        )
        .padding()
    }
}
