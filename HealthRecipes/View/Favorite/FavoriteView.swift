//
//  FavoriteView.swift
//  HealthRecipes
//
//  Created by  Sasha Khomenko on 20.01.2021.
//  Copyright © 2021  Sasha Khomenko. All rights reserved.
//


import SwiftUI

struct FavoriteView: View {
    
    @EnvironmentObject var favoriteViewModel: FavoriteViewModel
    
    var body: some View {
        
        NavigationView {
            ScrollView (.vertical, showsIndicators: false) {
                ZStack {
                    VStack  {
                        Image("heart")
                            .resizable()
                            .frame(width: 66, height: 66, alignment: .center)
                        Text("Список избранных рецептов пуст")
                            .font(.system(size: 28, weight: .bold, design: .rounded))
                            .multilineTextAlignment(.center)
                    }
                    .opacity(favoriteViewModel.favoriteRecipes.isEmpty ? 1 : 0)
                    .padding()
                    .padding(.top, 170)
                    .opacity(0.3)
                    Spacer()
                    
                    VStack(alignment: .center, spacing: 20) {
                        ForEach(favoriteViewModel.favoriteRecipes) { item in
                            FoodItemView(recipe: item)
                        }
                    }
                    .frame(maxWidth: 640)
                    .padding(.horizontal)
                }
            }
            .navigationBarTitle(Text("Избранное"))
        }
    }
}

struct FavoriteView_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteView()
            .environmentObject(FavoriteViewModel())
    }
}

