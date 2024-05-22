//
//  CategoryItem.swift
//  movieFinder
//
//  Created by Joe Lee on 5/11/24.
//

import SwiftUI

struct CategoryItem: View {
    @State var staff: Staff
    
    var body: some View {
        VStack(alignment: .leading){
            AsyncImage(url: URL(string: staff.imageURL)) { phase in
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
            Text(staff.name)
                .foregroundStyle(.primary)
                .font(.subheadline)
        }
        .padding(.leading, 15)
        .onAppear(perform: {
            /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Code@*/ /*@END_MENU_TOKEN@*/
        })
    }
}

//#Preview {
//    DirectorItem(director: (ModelData().categories["directors"]?[0]) as! Director)
//}
