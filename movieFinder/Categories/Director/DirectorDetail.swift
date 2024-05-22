//
//  DirectorDetail.swift
//  movieFinder
//
//  Created by Joe Lee on 5/11/24.
//

import SwiftUI

struct DirectorDetail: View {
    @Environment(ModelData.self) var modelData
    var director: Staff
    
    var body: some View {
        ScrollView{
            // TODO: Director Image
            AsyncImage(url: URL(string: director.imageURL)) { phase in
                if let image = phase.image {
                    // Display the loaded image
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                } else {
                    // Display a placeholder while loading
                    Text("Loading failed")
                }
            }
            VStack{
                HStack {
                    Text(director.name)
                        .font(.title)
                }
                
                HStack {
                    Text("Director")
                }
                .foregroundStyle(.secondary)
                .font(.subheadline)
            }
            
            VStack(alignment: .center) {
                Text("Movies Directed: ")
                    .font(.headline)
                
                VStack{
                    ForEach(director.movies.sorted(by: {(a,b) in
                        var year1 = a.value["Year"] as! String
                        var year2 = b.value["Year"] as! String
                        let year1_int = Int(year1) ?? 0
                        let year2_int = Int(year2) ?? 0
                        
                        return year1_int < year2_int
                    }), id: \.self.key){movie in
                        HStack {
                            Text(movie.key)
                            Text("(\(movie.value["Year"] as? String ?? ""))")
                        }
                        Spacer()
                    }
                }
            }
            .padding()
        }
        .navigationTitle(director.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    let modelData = ModelData()
    return DirectorDetail(director: Staff(id: 1, name: "Hi"))
        .environment(modelData)
}
