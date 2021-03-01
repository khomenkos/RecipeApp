//
//  CategoryView.swift
//  HealthRecipes
//
//  Created by  Sasha Khomenko on 20.01.2021.
//  Copyright © 2021  Sasha Khomenko. All rights reserved.
//

import SwiftUI

struct CategoryView: View {
    var body: some View {
        NavigationView {
            List {
                
                NavigationLink(destination: DetailView(currentCategory: .breakfast)) {
                    CategorysView(imageName: "Завтрак", categoryName: "Завтрак")
                }
                
                NavigationLink(destination: DetailView(currentCategory: .salads)) {
                    CategorysView(imageName: "Салаты", categoryName: "Салаты")
                }
                
                NavigationLink(destination: DetailView(currentCategory: .soups)) {
                    CategorysView(imageName: "Супы", categoryName: "  Супы")
                }
                
                NavigationLink(destination: DetailView(currentCategory: .mainDishes)) {
                    CategorysView(imageName: "Основные блюда", categoryName: "  Основные блюда")
                }
                
                NavigationLink(destination: DetailView(currentCategory: .fastAndHelpful)) {
                    CategorysView(imageName: "Быстро и полезно", categoryName: "Быстро и полезно")
                }
                
                NavigationLink(destination: DetailView(currentCategory: .dinner)) {
                    CategorysView(imageName: "Кухня мира", categoryName: "Кухня мира")
                }
                
                NavigationLink(destination: DetailView(currentCategory: .dietary)) {
                    CategorysView(imageName: "Диетическое", categoryName: "Диетическое")
                }
                
                NavigationLink(destination: DetailView(currentCategory: .bakingDesserts)) {
                    CategorysView(imageName: "Выпечка и десерты", categoryName: "Выпечка и десерты")
                }
                
                NavigationLink(destination: DetailView(currentCategory: .drinks)) {
                    CategorysView(imageName: "Напитки", categoryName: "  Напитки")
                }
                
                NavigationLink(destination: DetailView(currentCategory: .bbqGrill)) {
                    CategorysView(imageName: "BBQ и гриль", categoryName: "BBQ и гриль")
                }
            }
            .navigationBarTitle("Категории")
        }
    }
}


struct CategoryView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryView()
    }
}

struct CategorysView: View {
    
    var imageName: String
    var categoryName: String
    
    var body: some View {
        HStack (alignment: .center, spacing: 12) {
            
            HStack (alignment: .center, spacing: 2) {
                Image(imageName)
                    .frame(width: 135, height: 135, alignment: .center)
                    .cornerRadius(20.0)
                
                Text(categoryName)
                    .font(Font.custom("BERNIER Shade", size: 29))
                    .fontWeight(.bold)
                    .foregroundColor(Color("ColorGreenAdaptive"))
                    .lineLimit(2)
                    .multilineTextAlignment(.center)
                }
            .padding()
        }
    }
}
