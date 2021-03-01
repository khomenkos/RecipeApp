//  HealthRecipes
//
//  Created by  Sasha Khomenko on 20.01.2021.
//  Copyright © 2021  Sasha Khomenko. All rights reserved.
//


import SwiftUI

struct RowView: View {
    
    @Binding var checklistItem: CheckListItem
    
    var body: some View {
        
        ScrollView (.vertical, showsIndicators: true){
            VStack (alignment: .leading, spacing: 16) {
                NavigationLink(destination: EditChecklistItemView(cheklistItem: $checklistItem)){
                    HStack (alignment: .top, spacing: 16){
                        Text("\(checklistItem.name)")
                            .font(.system(size: 20, weight: .bold, design: .rounded))
                        Spacer()
                    }
                    .buttonStyle(PlainButtonStyle())
                    .padding()
                }
            }
        }
    }
}

struct RowView_Previews: PreviewProvider {
    static var previews: some View {
        RowView(checklistItem: .constant(CheckListItem(name: "Sample item",description: "Sample discription", cooking: "same")))
    }
}
