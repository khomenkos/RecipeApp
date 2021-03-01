//
//  DetailView.swift
//  HealthRecipes
//
//  Created by  Sasha Khomenko on 20.01.2021.
//  Copyright © 2021  Sasha Khomenko. All rights reserved.
//

import SwiftUI

struct DetailView: View {
    var currentCategory: Category

    @EnvironmentObject var recipeListViewModel: RecipeListViewModel
    
    var body: some View {
        List(filteredFood()) { recipes in
            FoodItemView(recipe: recipes)
        }.navigationBarTitle(Text(categoryString(for: currentCategory)), displayMode: .inline)
        
    }
    
    fileprivate func filteredFood() -> [Recipe] {
        return sampleRecipes.filter({ (food) -> Bool in
            food.category == currentCategory
        })
    }
    
    fileprivate func categoryString(for category: Category) -> String{
        switch category {
        case .breakfast:
            return "Завтрак"
        case .salads:
            return "Салаты"
        case .soups:
            return "Супы"
        case .mainDishes:
            return "Основные блюда"
        case .fastAndHelpful:
            return "Быстро и полезно"
        case .dinner:
            return "Кухня мира"
        case .dietary:
            return "Диетическое"
        case .bakingDesserts:
            return "Выпечка и десерты"
        case .drinks:
            return "Напитки"
        case .bbqGrill:
            return "BBQ и гриль"
        }
    }
}
