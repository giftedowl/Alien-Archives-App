//
//  AliensArchive.swift
//  Aliens Archive
//
//  Created by John Lane on 11/16/24.
//

import SwiftUI
import FirebaseCore

@main
struct AliensArchive: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate

    var body: some Scene {
        WindowGroup {
            SpeciesView()
        }
    }
}
