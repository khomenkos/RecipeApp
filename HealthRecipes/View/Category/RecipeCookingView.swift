//
//  RecipeCookingView.swift
//  HealthRecipes
//
//  Created by  Sasha Khomenko on 20.01.2021.
//  Copyright © 2021  Sasha Khomenko. All rights reserved.
//

import SwiftUI

struct RecipeCookingView: View {
    
    var recipe: Recipe
    
    var body: some View {
        HStack (alignment: .center, spacing: 12) {
            
            HStack (alignment: .center, spacing: 2) {
                Image(systemName: "person.2")
                Text("Порции: \(recipe.serves)")
            }
            
            HStack (alignment: .center, spacing: 2) {
                Image(systemName: "clock")
                Text(" Время готовки: \(recipe.cooking)")
            }
        }
        .font(.footnote)
        .foregroundColor(Color.gray)
    }
}

struct RecipeCookingView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeCookingView(recipe: sampleRecipes[0])
            .previewLayout(.fixed(width: 320, height: 60))
    }
}
