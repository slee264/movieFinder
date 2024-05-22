//
//  movieFinderApp.swift
//  movieFinder
//
//  Created by Joe Lee on 5/10/24.
//

import SwiftUI

@main
struct movieFinderApp: App {
    @State private var modelData = ModelData()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(modelData)
        }
    }
}
