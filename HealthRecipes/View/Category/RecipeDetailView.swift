//
//  RecipeDetailView.swift
//  HealthRecipes
//
//  Created by  Sasha Khomenko on 20.01.2021.
//  Copyright © 2021  Sasha Khomenko. All rights reserved.
//

import SwiftUI

struct RecipeDetailView: View {
    
    var recipe: Recipe
    @State private var pulsate: Bool = false
    @Environment(\.presentationMode) var presentationMode
    
    @State private var showAlertAddFavorite: Bool = false
    @EnvironmentObject var favoriteViewModel: FavoriteViewModel
    @EnvironmentObject var recipeViewModel: RecipeViewModel
    
    var body: some View {
        ScrollView (.vertical, showsIndicators: false) {
            
            VStack (alignment: .center, spacing: 0) {
                
                ZStack(alignment: .bottom) {
                    TabView{
                    Image(recipe.recipeImage)
                        .resizable()
                        .scaledToFit()
                    }.tabViewStyle(PageTabViewStyle())
                    
                    HStack {
                        Spacer()
                        
                        Button(action: {
                            if self.recipeViewModel.favorite {
                                self.favoriteViewModel.removeRecipeFromFavorites(recipe: self.recipe)
                                self.recipeViewModel.setFavorite(flag: false)
                            } else {
                                self.favoriteViewModel.addRecipeToFavorites(recipe: self.recipe)
                                self.recipeViewModel.setFavorite(flag: true)
                                self.showAlertAddFavorite.toggle()
                                DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                                    self.showAlertAddFavorite.toggle()
                                }
                            }
                        }) {
                            Image(systemName: recipeViewModel.favorite ? "bookmark.fill" : "bookmark")
                                .font(.system(size:30, weight: .light))
                                .foregroundColor(Color.white)
                                .shadow(color: Color.gray, radius: 2, x: 0, y: 0)
                                .padding(20)
                        }
                    }
                    .background(
                        LinearGradient(gradient: Gradient(colors: [Color.clear, Color.black]), startPoint: .top, endPoint: .bottom)
                    )
                }
                
                Group{
                    Text(recipe.title)
                        .font(.system(.title, design: .serif))
                        .fontWeight(.bold)
                        .foregroundColor(Color("ColorGreenAdaptive"))
                        .multilineTextAlignment(.center)
                        .padding(.top, 10)
                    
                    HStack {
                        RecipeCookingView(recipe: recipe)
                    }
                    
                    Text("Ингредиенты")
                        .fontWeight(.bold)
                        .modifier(TitleModifier())
                    
                    VStack (alignment: .leading, spacing: 5) {
                        ForEach(recipe.ingredients, id: \.self) { item in
                            VStack (alignment: .leading, spacing: 5) {
                                Text(item)
                                    .font(.footnote)
                                    .multilineTextAlignment(.leading)
                                Divider()
                            }
                        }
                    }
                    
                    Text("Приготовление")
                        .fontWeight(.bold)
                        .modifier(TitleModifier())
                    ForEach(recipe.instructions, id: \.self) { instruction in
                        VStack (alignment: .center, spacing: 5) {
                            Image(systemName: "chevron.down.circle")
                                .resizable()
                                .frame(width: 42, height: 42, alignment: .center)
                                .imageScale(.large)
                                .font(Font.title.weight(.ultraLight))
                                .foregroundColor(Color("ColorGreenAdaptive"))
                            
                            Text(instruction)
                                .lineLimit(nil)
                                .multilineTextAlignment(.center)
                                .font(.system(.body, design: .serif))
                                .frame(minHeight: 80)
                        }
                    }
                }
                .padding(.horizontal, 24)
                .padding(.vertical, 12)
            }
        }
        .edgesIgnoringSafeArea(.top)
        .overlay(
            HStack {
                Spacer()
                VStack{
                    Button(action: {
                        // ACTION
                        self.presentationMode.wrappedValue.dismiss()
                    }, label: {
                        Image(systemName: "chevron.down.circle.fill")
                            .font(.title)
                            .foregroundColor(Color.white)
                            .shadow(radius: 4)
                            .opacity(self.pulsate ? 1 : 0.6)
                            .scaleEffect(self.pulsate ? 1.2 : 0.8, anchor: .center)
                            .animation(Animation.easeInOut(duration: 1.5).repeatForever(autoreverses: true))
                    })
                    .padding(.trailing, 20)
                    .padding(.top, 24)
                    Spacer()
                }
            }
        )
        .onAppear() {
            self.pulsate.toggle()
        }
    }
}

struct RecipeDetailView_Previews: PreviewProvider {
    
    static var previews: some View {
        NavigationView {
            RecipeDetailView(recipe: sampleRecipes[0])
                .environmentObject(FavoriteViewModel())
        }
    }
}
