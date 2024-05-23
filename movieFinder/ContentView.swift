//
//  ContentView.swift
//  movieFinder
//
//  Created by Joe Lee on 5/10/24.
//

import SwiftUI

struct ContentView: View {
    @Environment(ModelData.self) var modelData
    @State private var searchText = ""
    
    var body: some View {
        if modelData.initial_display_directors.isEmpty{
            ProgressView("Loading...")
        }else{
            CategoryHome(searchText: $searchText)
                .searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .always))
        }
    }
}

#Preview {
    ContentView()
        .environment(ModelData())
}
