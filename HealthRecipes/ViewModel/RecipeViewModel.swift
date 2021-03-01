//
//  RecipeViewModel.swift
//  HealthRecipes
//
//  Created by  Sasha Khomenko on 20.01.2021.
//  Copyright © 2021  Sasha Khomenko. All rights reserved.
//

import SwiftUI


final class RecipeViewModel: ObservableObject {
    
    @Published var favorite: Bool = false
    
    var recipe: Recipe
    
    init(recipe: Recipe) {
        self.recipe = recipe
        
        let data = UserDefaults.standard.data(forKey: keyFavorites)
        
        if (data != nil) {
            let favoriteRecipes = try! JSONDecoder().decode([Recipe].self, from: data!)
            if favoriteRecipes.firstIndex(of: recipe) != nil {
                self.favorite = true
            }
        }
    }
}

extension RecipeViewModel {
    func setFavorite(flag: Bool) {
        self.favorite = flag
    }
}
