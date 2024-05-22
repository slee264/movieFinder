//
//  CategoryRow.swift
//  movieFinder
//
//  Created by Joe Lee on 5/11/24.
//

import SwiftUI

struct CategoryRow: View {
    var categoryName: String
    var items: [Staff]
    
    var body: some View {
        VStack(alignment: .leading){
            Text(categoryName)
                .font(.headline)
                .padding(.leading, 15)
                .padding(.top, 5)
            
            ScrollView(.horizontal, showsIndicators: false){
                HStack(alignment: .top, spacing: 0){
                    ForEach(items, id: \.id){ staff in
                        NavigationLink {
                            switch categoryName {
                            case "Actors": ThespianDetail(thespian: staff)
                            case "Directors": DirectorDetail(director: staff)
                            default:
                                ComingSoon()
                            }
                        } label: {
                            CategoryItem(staff: staff)
                        }
                        
                    }
                }
            }
            .frame(height: 185)
        }
    }
}

//#Preview {
//    CategoryRow()
//}
