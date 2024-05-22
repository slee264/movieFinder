//
//  CategoryHome.swift
//  movieFinder
//
//  Created by Joe Lee on 5/11/24.
//

import SwiftUI

struct CategoryHome: View {
    @Environment(ModelData.self) var modelData
    
    var body: some View {
        NavigationSplitView {
            List {
                ForEach(modelData.categories.keys.sorted(), id:\.self) {key in CategoryRow(categoryName: key, items: Array(modelData.initial_display_directors))
                }
            }
            .listStyle(.inset)
        } detail: {
            Text("Select a category")
        }
    }
}

#Preview {
    CategoryHome()
        .environment(ModelData())
}
