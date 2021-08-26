//
//  NanoChallenge6App.swift
//  NanoChallenge6
//
//  Created by Beatriz Sato on 23/08/21.
//

import SwiftUI

@main
struct NanoChallenge6App: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            HomeScreen()
        }
    }
}
