//
//  FavoriteViewModel.swift
//  HealthRecipes
//
//  Created by  Sasha Khomenko on 20.01.2021.
//  Copyright © 2021  Sasha Khomenko. All rights reserved.
//

import SwiftUI


final class FavoriteViewModel: ObservableObject {
    
    @Published var favoriteRecipes: [Recipe] = []
    
    let defaults = UserDefaults.standard
    
    init() {
        let data = defaults.data(forKey: keyFavorites)

        if (data != nil) {
            favoriteRecipes = try! JSONDecoder().decode([Recipe].self, from: data!)
        }
    }
}

extension FavoriteViewModel {
    func addRecipeToFavorites(recipe: Recipe) {
        favoriteRecipes.append(recipe)
        let data = try! JSONEncoder().encode(favoriteRecipes)
        defaults.set(data, forKey: keyFavorites)
    }
    
    func removeRecipeFromFavorites(recipe: Recipe) {
        if let index = favoriteRecipes.firstIndex(of: recipe) {
            favoriteRecipes.remove(at: index)
        }
        let data = try! JSONEncoder().encode(favoriteRecipes)
        defaults.set(data, forKey: keyFavorites)
    }
}
