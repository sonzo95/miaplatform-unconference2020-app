//
//  DemoApp.swift
//  Demo
//
//  Created by Stefano Sonzogni on 23/09/2020.
//

import SwiftUI

@main
struct DemoApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(guitarViewModel: GuitarViewModel())
        }
    }
}
