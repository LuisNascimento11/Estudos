//
//  HikingApp.swift
//  Hiking
//
//  Created by Luís Filipe Nascimento on 26/12/22.
//

import SwiftUI

@main
struct HikingApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(hikes: Hike.all())
        }
    }
}
