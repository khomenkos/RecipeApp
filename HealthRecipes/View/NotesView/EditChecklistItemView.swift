//  HealthRecipes
//
//  Created by  Sasha Khomenko on 20.01.2021.
//  Copyright © 2021  Sasha Khomenko. All rights reserved.
//


import SwiftUI

struct EditChecklistItemView: View {
    
    @Binding var cheklistItem: CheckListItem
    
    var body: some View {
        Form{
            Section () {
                TextField("Название рецепта: ", text: $cheklistItem.name)
                    .font(.system(size: 20, weight: .bold, design: .rounded))
            }
            Section (header: Text("Ингредиенты")) {
                TextEditor(text: $cheklistItem.description)
                    .font(.system(size: 16,  design: .rounded))
                    .lineLimit(nil)
                    .frame(minHeight: 80, maxHeight: .infinity)
            }
            Section (header: Text("Ход готовки")) {
                TextEditor(text: $cheklistItem.cooking)
                    .font(.system(size: 16,  design: .rounded))
                    .lineLimit(nil)
                    .multilineTextAlignment(.leading)
                    .frame(minHeight: 130, maxHeight: .infinity)
            }
        }
    }
}

struct EditChecklistItemView_Previews: PreviewProvider {
    static var previews: some View {
        EditChecklistItemView(cheklistItem:
                                .constant(CheckListItem(name: "Sample item",description: "Sample discription", cooking: "same")))
    }
}
