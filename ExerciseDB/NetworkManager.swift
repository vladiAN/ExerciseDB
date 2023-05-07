//
//  NetworkManager.swift
//  ExerciseDB
//
//  Created by Алина Андрушок on 21.04.2023.
//

import Foundation

struct Exercise: Identifiable, Codable, Hashable {
    let bodyPart: String
    let equipment: String
    let gifUrl: String
    let id: String
    let name: String
    let target: String
}

struct WebService {
    
    static let shared = WebService()
    
    private init() {}
    
    func fetchData<T: Decodable>(fromURL url: String, completion: @escaping (Result<T, Error>) -> Void) {
        let headers = [
            "X-RapidAPI-Key": "2fe2d940e0msh24be2bf9f8e9dfdp185d58jsne869a06dac25",
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
    
    func fetchExercises(withIds ids: [String], completion: @escaping (Result<[Exercise], Error>) -> Void) {
        
        var exercises: [Exercise] = []
        
        let dispatchGroup = DispatchGroup()
        for id in ids {
            dispatchGroup.enter()
            
            let url = "https://exercisedb.p.rapidapi.com/exercises/exercise/\(id)"
            fetchData(fromURL: url) { (result: Result<Exercise, Error>) in
                
                switch result {
                case .success(let exercise):
                    exercises.append(exercise)
                case .failure(let error):
                    print("Error fetching exercise with id \(id): \(error)")
                }
                
                dispatchGroup.leave()
            }
        }
        
        dispatchGroup.notify(queue: .main) {
            completion(.success(exercises))
        }
    }
    
}








