//
//  ContentView.swift
//  HealthRecipes
//
//  Created by  Sasha Khomenko on 20.01.2021.
//  Copyright © 2021  Sasha Khomenko. All rights reserved.
//
import SwiftUI

struct ContentView: View {
    
    var body: some View {
        
        TabView {
            HomeView()
                .tabItem({
                    Image(systemName: "house")
                    Text("Главная")
                })
            CategoryView()
                .tabItem({
                    Image(systemName: "book")
                    Text("Категории")
                })
            FavoriteView()
                .tabItem({
                    Image(systemName: "star")
                    Text("Избранное")
                })
            CheckListView()
                .tabItem({
                    Image(systemName: "note")
                    Text("Мои рецепты")
                })
        }
        .edgesIgnoringSafeArea(.leading)
        .accentColor(Color.primary)
    }
}

struct TitleModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(.title, design: .serif))
            .foregroundColor(Color("ColorGreenAdaptive"))
            .padding(8)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        
    }
}
