//
//  HotProspectsApp.swift
//  HotProspects
//
//  Created by Edwin on 5/7/24.
//

import SwiftData
import SwiftUI

@main
struct HotProspectsApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Prospect.self)
    }
}
