//
//  ContentView.swift
//  movieFinder
//
//  Created by Joe Lee on 5/10/24.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        CategoryHome()
    }
}

#Preview {
    ContentView()
        .environment(ModelData())
}
