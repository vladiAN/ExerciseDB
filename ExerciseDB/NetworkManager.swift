//
//  NetworkManager.swift
//  ExerciseDB
//
//  Created by Алина Андрушок on 21.04.2023.
//

import Foundation

struct Exercise: Codable {
    let bodyPart: String
    let equipment: String
    let gifUrl: String
    let id: String
    let name: String
    let target: String
}



struct Webservice {
    
    func fetchData<T: Decodable>(fromURL url: String, completion: @escaping (Result<T, Error>) -> Void) {
        let headers = [
            "X-RapidAPI-Key": "d24a32bcd0mshb80160bcd236dd0p1e973ejsnd7c968e943bf",
            "X-RapidAPI-Host": "exercisedb.p.rapidapi.com"
        ]
        
        guard let url = URL(string: url) else {
            print("Invalid URL")
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print("Error: \(error)")
            } else if let data = data {
                do {
                    let object = try JSONDecoder().decode(T.self, from: data)
                    completion(.success(object))
                } catch {
                    completion(.failure(error))
                }
            }
        }.resume()
    }
}








