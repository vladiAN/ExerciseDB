//
//  FavoritesManager.swift
//  ExerciseDB
//
//  Created by Алина Андрушок on 02.05.2023.
//

import Foundation

class FavoritesManager {
    
    static let shared = FavoritesManager()
    let defaults = UserDefaults.standard
    
    private let key = "Favorites"
    
    private init() {
        defaults.register(defaults: [key : []])
    }
    
    func isContainsExercise(idExercise: String) -> Bool {
        let favorites = defaults.stringArray(forKey: key) ?? []
        if favorites.contains(idExercise) {
            return true
        } else {
            return false
        }
    }
    
    
    func addLikedExercise(idExercise: String) {
        var favorites = defaults.stringArray(forKey: key) ?? []
        if !favorites.contains(idExercise) {
            favorites.append(idExercise)
            defaults.set(favorites, forKey: key)
        }
    }
    
    func removeLikedExercise(idExercise: String) {
        var favorites = defaults.stringArray(forKey: key) ?? []
        if let index = favorites.firstIndex(of: idExercise) {
            favorites.remove(at: index)
            defaults.set(favorites, forKey: key)
        }
    }
    
    func getFavorites() -> [String] {
        return defaults.stringArray(forKey: key) ?? []
    }
}
