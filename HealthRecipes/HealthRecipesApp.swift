//
//  HealthRecipesApp.swift
//  HealthRecipes
//
//  Created by  Sasha Khomenko on 20.01.2021.
//  Copyright © 2021  Sasha Khomenko. All rights reserved.
//

import SwiftUI

@main
struct HealthRecipesApp: App {
    @StateObject private var recipeViewModels = RecipeListViewModel()
    @StateObject private var recipeViewModelss = FavoriteViewModel()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(recipeViewModels)
                .environmentObject(recipeViewModelss)
        }
    }
}

