//
//  FoodItemView.swift
//  HealthRecipes
//
//  Created by  Sasha Khomenko on 20.01.2021.
//  Copyright © 2021  Sasha Khomenko. All rights reserved.
//

import SwiftUI

struct FoodItemView: View {
    
    var recipe: Recipe
    var hapticImpact = UIImpactFeedbackGenerator(style: .heavy)
    @State private var showModal: Bool = false
    @EnvironmentObject var favoriteViewModel: FavoriteViewModel
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 0) {
            Image(recipe.recipeImage)
                .resizable()
                .scaledToFit()
            
            VStack (alignment: .leading, spacing: 12) {
                Text(recipe.title)
                    .font(Font.custom("Albatross", size: 20))                    .fontWeight(.bold)
                    .foregroundColor(Color("ColorGreenAdaptive"))
                    .lineLimit(2)
                
                Text(recipe.headline)
                    .foregroundColor(Color.gray)
                    .font(.system(size: 12))


            }
            .padding()
            .padding(.bottom, 1)
        }

        .background(Color("ColorAppearanceAdaptive"))
        .cornerRadius(12)
        .shadow(color: Color("ColorBlackTransparentLight"), radius: 8, x: 0, y: 0)
        .padding(.leading, 8)
        .padding(.trailing, 8)
        
        .onTapGesture() {
            self.hapticImpact.impactOccurred()
            self.showModal = true
        }
        .sheet(isPresented: self.$showModal) {
            RecipeDetailView(recipe: self.recipe)
                .environmentObject(self.favoriteViewModel)
                .environmentObject(RecipeViewModel(recipe: self.recipe))
        }
    }
}

struct FoodItemView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            FoodItemView(recipe: sampleRecipes[0])
                .previewLayout(.sizeThatFits)
                .colorScheme(.light)
            
            FoodItemView(recipe: sampleRecipes[0])
                .previewLayout(.sizeThatFits)
                .colorScheme(.dark)
        }
    }
}
