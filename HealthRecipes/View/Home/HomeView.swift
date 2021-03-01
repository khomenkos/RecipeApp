//
//  HomeView.swift
//  HealthRecipes
//
//  Created by  Sasha Khomenko on 20.01.2021.
//  Copyright © 2021  Sasha Khomenko. All rights reserved.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var recipeListViewModel: RecipeListViewModel
    
    var facts: [Fact] = factsData
    
    var body: some View {
        
        ZStack (alignment: .bottom) {
            ScrollView(.vertical, showsIndicators: false){
                VStack(alignment: .center, spacing: 20) {


                    RecipeRowView(categoryName: "Рекомендации", recipes: recipeListViewModel.editorRecipesData)

                    RecipeRowView(categoryName: "Топ", recipes: recipeListViewModel.trendingRecipesData)
                    
                    Text("Все рецепты")
                        .fontWeight(.bold)
                        .modifier(TitleModifier())
                    
                    VStack(alignment: .center, spacing: 20) {
                        ForEach(recipeListViewModel.recipeData) { item in
                            FoodItemView(recipe: item)
                        }
                    }
                    .frame(maxWidth: 640)
                    .padding(.horizontal)
                    
                    ScrollView(.horizontal,showsIndicators: false){
                        HStack(alignment: .top, spacing: 60){
                            ForEach(facts) { item in
                                FactsView(fact: item)
                            }
                        }
                        .padding(.vertical)
                        .padding(.leading, 60)
                        .padding(.trailing, 20)
                        .padding(.bottom, 85)
                    }
                }
                .padding(.top, 50)
            }
            .edgesIgnoringSafeArea(.all)
            .padding(0)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(facts: factsData)
            .environment(\.colorScheme, .dark)
            .environmentObject(RecipeListViewModel())
    }
}
