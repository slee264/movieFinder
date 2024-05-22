//
//  Movie.swift
//  movieFinder
//
//  Created by Joe Lee on 5/10/24.
//

import Foundation
import SwiftUI

struct Movie: Hashable, Identifiable {
    
    static func == (lhs: Movie, rhs: Movie) -> Bool {
        return lhs.name == rhs.name
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
        hasher.combine(name)
    }

    var id: Int
    var name: String
    var directors: [Staff]
    var writers: [Staff]
    var actors: [Staff]
    
    private var imageName: String
//    var image: Image {
//        Image(imageName)
//    }
//    
//    private enum CodingKeys: String, CodingKey {
//        case id, name, directors, writers, actors
//    }
    
//    init(from decoder: Decoder) throws {
//        let values = try decoder.container(keyedBy: CodingKeys.self)
//        id = (try? values.decode(Int.self, forKey: .id)) ?? 0
//        name = (try? values.decode(String.self, forKey: .id)) ?? "NoName"
//        directors = (try? values.decode(Staff.self, forKey: .directors)) ?? []
//        
//    }
}
