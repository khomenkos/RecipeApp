//
//  RecipeRowView.swift
//  HealthRecipes
//
//  Created by  Sasha Khomenko on 20.01.2021.
//  Copyright © 2021  Sasha Khomenko. All rights reserved.
//

import SwiftUI

struct RecipeRowView: View {
    
    // MARK: - PROPERTIEIS
    var categoryName: String
    var recipes: [Recipe]
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(self.categoryName)
                .font(.custom("HelveticaNeue-Medium", size: 25))
                .fontWeight(.bold)
                .padding(.leading, 15)
                .padding(.top, 5)
                .foregroundColor(Color("ColorGreenAdaptive"))
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .top, spacing: 0) {
                    ForEach(self.recipes) { item in
                        RecipeItem(recipe: item)
                    }
                }
            }
            .frame(height: 185)
        }
    }
}

struct RecipeItem: View {
    
    // MARK: - PROPERTIEIS
    var recipe: Recipe
    @State private var showModal: Bool = false
    
    @EnvironmentObject var favoriteViewModel: FavoriteViewModel
    
    var body: some View {
        VStack(alignment: .leading) {
            ZStack(alignment: .bottom) {
                Image(recipe.recipeImage)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 155, height: 155, alignment: .center)
                
                HStack {
                    Image(systemName: "person.2")
                        .foregroundColor(Color.white)
                        .font(.callout)
                        .padding(.leading, 5)
                    
                    Text("\(recipe.serves)")
                        .foregroundColor(Color.white)
                        .font(.callout)
                    Spacer()
                    
                    Text(recipe.cooking)
                        .foregroundColor(Color.white)
                        .font(.callout)
                        .padding(.trailing, 5)
                }
                .background(
                    LinearGradient(gradient: Gradient(colors: [Color.clear, Color.black]), startPoint: .top, endPoint: .bottom)
                        .padding(.top, -20))
            }
            .cornerRadius(5)
            
            Text(recipe.title)
                .foregroundColor(.primary)
                .fontWeight(.light)
        }
        .padding(.leading, 15)
        .onTapGesture {
            self.showModal = true
        }
        .sheet(isPresented: self.$showModal) {
            RecipeDetailView(recipe: self.recipe)
                .environmentObject(self.favoriteViewModel)
                .environmentObject(RecipeViewModel(recipe: self.recipe))
        }
    }
}

struct RecipeRowView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeRowView(categoryName:"Trending", recipes: sampleRecipes)
    }
}
