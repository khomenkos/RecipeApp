//  HealthRecipes
//
//  Created by  Sasha Khomenko on 20.01.2021.
//  Copyright © 2021  Sasha Khomenko. All rights reserved.
//


import SwiftUI
import Foundation

struct CheckListItem:Identifiable, Codable{
    var id = UUID()
    var name: String
    var description: String
    var cooking: String
}
