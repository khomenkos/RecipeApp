//
//  FactsView.swift
//  HealthRecipes
//
//  Created by  Sasha Khomenko on 20.01.2021.
//  Copyright © 2021  Sasha Khomenko. All rights reserved.
//

import SwiftUI

struct FactsView: View {
    
    var fact: Fact
    var body: some View {
        
        ZStack {
            VStack {
                Text(fact.title)
                    .font(.headline)
                    .padding(.leading)
                    .font(.callout)
                    .foregroundColor(Color.white)
                    .offset(x: 0, y: 15)
                    .shadow(radius: 3)
                
                Text(fact.content)
                    .padding(.leading, 45)
                    .padding(.trailing, 10)
                    .padding(.vertical, 3)
                    .frame(width: 300, height: 120, alignment: .center)
                    .lineLimit(5)
                    .multilineTextAlignment(.leading)
                    .font(.footnote)
                    .foregroundColor(Color.white)
            }
            .background(LinearGradient(gradient: Gradient(colors: [Color("ColorGreenMedium"), Color("ColorGreenLight")]), startPoint: .leading, endPoint: .trailing))
            .cornerRadius(12)
            
            Image(fact.image)
                .resizable()
                .frame(width: 66, height: 66, alignment: .center)
                .clipShape(Circle())
                .background(Circle()
                                .fill(Color.white))
                .frame(width: 74, height: 74, alignment: .center)
                .background(
                    Circle()
                        .fill(LinearGradient(gradient: Gradient (colors: [Color("ColorGreenMedium"),Color("ColorGreenLight")]), startPoint: .trailing, endPoint: .leading))
                        .frame(width: 82, height: 82, alignment: .center))
                .background(
                    Circle()
                        .fill(Color("ColorAppearanceAdaptive"))
                        .frame(width: 90, height: 90, alignment: .center))
                .offset(x: -155 )
        }
    }
}

struct FactsView_Previews: PreviewProvider {
    static var previews: some View {
        FactsView(fact: factsData[0])
            .previewLayout(.fixed(width: 400, height: 220))
    }
}
