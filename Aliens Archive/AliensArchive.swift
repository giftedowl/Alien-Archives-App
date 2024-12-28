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
            ZStack {
                Image("BackgroundImage")
                    .resizable()
                    .ignoresSafeArea()
                SpeciesView()
            }
        }
    }
}
