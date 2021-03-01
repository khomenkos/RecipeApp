//
//  RecipesModel.swift
//  HealthRecipes
//
//  Created by  Sasha Khomenko on 20.01.2021.
//  Copyright © 2021  Sasha Khomenko. All rights reserved.
//

import SwiftUI

struct Recipe: Identifiable, Codable, Equatable {
    var id =  UUID()
    var recipeImage: String
    var title: String
    var headline: String
    var serves: String
    var cooking: String
    var instructions: [String]
    var ingredients: [String]
    var isEditorChoice: Bool
    var isTrending: Bool
    var category: Category

}

enum Category: String, CaseIterable, Hashable, Codable {
    case breakfast
    case salads
    case soups
    case mainDishes
    case fastAndHelpful
    case dinner
    case dietary
    case bakingDesserts
    case drinks
    case bbqGrill
}

