//
//  ThespianDetail.swift
//  movieFinder
//
//  Created by Joe Lee on 5/11/24.
//

import SwiftUI

struct ThespianDetail: View {
    @Environment(ModelData.self) var modelData
    var thespian: Staff
    
    var body: some View {
        ScrollView{
            // TODO: Director Image
            VStack{
                HStack {
                    Text(thespian.name)
                        .font(.title)
                }
                
                HStack {
                    Text("Actor")
                }
                .foregroundStyle(.secondary)
                .font(.subheadline)
            }
            
            VStack(alignment: .leading) {
                                
                Text("Starred In: ")
                
                VStack{
                    ForEach(thespian.movies.keys.sorted(), id: \.self){movie in
                        Text(movie)
                    }
                }
            }
            .padding()
        }
        .navigationTitle(thespian.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    let modelData = ModelData()
    return ThespianDetail(thespian: modelData.thespians[0])
        .environment(modelData)
}
