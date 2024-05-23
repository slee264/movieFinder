//
//  Staff.swift
//  movieFinder
//
//  Created by Joe Lee on 5/11/24.
//

import Foundation
import SwiftUI

@Observable
class Staff: Identifiable, Hashable {
    
    var id: Int
    var name: String
    var movies: [String : [String: Any]]
    var imageURL: String
    
    public static func ==(lhs: Staff, rhs: Staff) -> Bool {
        return lhs.id == rhs.id
    }
    
    public func hash(into hasher: inout Hasher){
        return hasher.combine(self.id)
    }
    
    init(id: Int, name: String, movies: [String: [String: Any]] = [:], imageURL: String = ""){
        self.id = id
        self.name = name
        self.movies = movies
        self.imageURL = imageURL
    }
        
//    private enum CodingKeys: String, CodingKey {
//        case id, name, movies, imageName
//    }
    
//    required init(from decoder: Decoder) throws {
//        let values = try decoder.container(keyedBy: CodingKeys.self)
//        id = (try? values.decode(String.self, forKey: .id)) ?? 0
//        name = (try? values.decode(String.self, forKey: .name)) ?? ""
//
//        imageName = (try? values.decode(String.self, forKey: .imageName)) ?? ""
//    }
}
