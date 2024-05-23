//
//  ModelData.swift
//  movieFinder
//
//  Created by Joe Lee on 5/10/24.
//

import Foundation
import SwiftUI

@Observable
class ModelData{
    var text: String = "Hello"
    var initial_display_directors : [Staff] = [Staff]()
    var directors : [Staff] = [Staff]()
    var thespians : [Staff] = [Staff]()

//    var movies  : [Movie] = load("movieTestData.json")
    
    var categories: [String: [Staff]]{
        ["Directors": directors,
//         "Actors": thespians
        ]
    }
    
    init() {
        self.get_display_directors()
        self.get_all_directors()
    }

    func get_display_directors() {
        let url = URL(string: "http://localhost:8000/directors/get_display_directors/")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        let task = URLSession.shared.dataTask(with: request) {data, response, error in
            if let error = error {
                print(error)
                return
            }
            guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else{
                return
            }

            if let mimeType = httpResponse.mimeType, mimeType == "application/json",
               let data = data,
                let listOfDirectors =
                try? JSONSerialization.jsonObject(with: data, options: [])
                as? [[String: Any]]{
                DispatchQueue.main.async{
                    for director in listOfDirectors{
                        if let id = director["id"] as? Int,
                        let name = director["name"] as? String,
                        let imageURL = director["imageURL"] as? String,
                           let movies = director["movies"] as? [String: [String: Any]]{
                            self.initial_display_directors.append(Staff(id: id, name: name, movies: movies, imageURL: imageURL))
                        }
                    }
                }
            }
        }
        task.resume()
    }
    
    func get_all_directors() {
        let url = URL(string: "http://localhost:8000/directors/list_of_directors/")!
        let task = URLSession.shared.dataTask(with: url) {data, response, error in
            if let error = error {
                print(error)
                return
            }
            guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else{
                return
            }

            if let mimeType = httpResponse.mimeType, mimeType == "application/json",
               let data = data, 
                let listOfDirectors =
                try? JSONSerialization.jsonObject(with: data, options: [])
                as? [[String: Any]]{
                DispatchQueue.main.async{
                    for director in listOfDirectors{
                        if let id = director["id"] as? Int,
                        let name = director["name"] as? String,
                        let imageURL = director["imageURL"] as? String{
                            self.directors.append(Staff(id: id, name: name, imageURL: imageURL))
                        }
                    }
                }
            }
            
        }
        task.resume()
    }
    
    func fetchDirector(director: Staff){
        let id = String(director.id)
        let url = URL(string: "http://localhost:8000/directors/\(id)")!
        let task = URLSession.shared.dataTask(with: url) {data, response, error in
            if let error = error {
                print(error)
                return
            }
            guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else{
                return
            }
            if let mimeType = httpResponse.mimeType,
                mimeType == "application/json",
               let data = data,
                let newDirector = try? JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]{
                DispatchQueue.main.async{
                    if let newMovies = newDirector["movies"] as? [String: [String: Any]]{
                        director.movies = newMovies
                    }
                    
                    if let imageURL = newDirector["imageURL"] as? String{
                        director.imageURL = imageURL
                    }
                }
            }
            
        }
        task.resume()
    }
}

func load<T: Decodable> (_ filename: String) -> T {
    let data: Data
    guard let file = Bundle.main.url(
        forResource: filename,
        withExtension: nil
    )else {
        fatalError("Couldn't find \(filename) in main bundle")
    }
    
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle")
    }
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}
