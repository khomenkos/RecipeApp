//
//  FactModel.swift
//  HealthRecipes
//
//  Created by  Sasha Khomenko on 20.01.2021.
//  Copyright © 2021  Sasha Khomenko. All rights reserved.
//

import Foundation

struct Fact: Identifiable {
    var id = UUID ()
    var image: String
    var title: String
    var content: String
}
