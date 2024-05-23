//
//  CategoryHome.swift
//  movieFinder
//
//  Created by Joe Lee on 5/11/24.
//

import SwiftUI

struct CategoryHome: View {
    @Environment(ModelData.self) var modelData
    @Environment(\.isSearching) private var isSearching
    @Binding var searchText: String
    
    private var searchResults: [Staff] {
        if (searchText.isEmpty){
            return modelData.directors
        }else{
            return modelData.directors.filter{ $0.name.contains(searchText)}
        }
    }
    
    var body: some View {
        NavigationSplitView {
            if isSearching{
                List(searchResults, id:\.self){ director in
                    NavigationLink{
                        DirectorDetail(director: director)
                    } label: {
                        Text(director.name)
                    }
                }
            }
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
    CategoryHome(searchText: .constant(""))
        .environment(ModelData())
}
