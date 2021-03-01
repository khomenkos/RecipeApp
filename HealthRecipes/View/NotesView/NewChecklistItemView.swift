//  HealthRecipes
//
//  Created by  Sasha Khomenko on 20.01.2021.
//  Copyright © 2021  Sasha Khomenko. All rights reserved.
//

import SwiftUI

struct NewChecklistItemView: View {
    
    var cheklist: Cheklist
    
    @Environment(\.presentationMode) var presentationMode
    
    @State var showErrorMessage = false
    @State var newItemIsChecked = true
    @State var newItemName = ""
    @State var newItemDiscription = ""
    @State var cookingProgress = ""
    
    var body: some View {
        VStack{
            HStack{
                Spacer()
                Button(action: {
                    
                    let newCheklistItem = CheckListItem(name: newItemName,
                                                        description: newItemDiscription, cooking: cookingProgress)
                    
                    if newItemDiscription == ""{
                        self.showErrorMessage = true
                    }
                    else{
                        self.cheklist.items.append(newCheklistItem)
                        self.cheklist.saveListData()
                        self.presentationMode.wrappedValue.dismiss()
                    }
                }){
                    HStack{
                        Image(systemName: "plus.circle.fill")
                        Text("Добавить")
                    }
                }
                .disabled(newItemName.count == 0)
                .alert(isPresented: $showErrorMessage){
                    Alert(title: Text("Внимание"),
                          message: Text("Не все поля заполнены!"),
                          primaryButton: .default(Text("Вернуться")),
                          secondaryButton:  .destructive(Text("Сохранить")){
                            let newCheklistItem = CheckListItem(name: newItemName,
                                                                description: newItemDiscription, cooking: cookingProgress)
                            self.cheklist.items.append(newCheklistItem)
                            self.cheklist.saveListData()
                            self.presentationMode.wrappedValue.dismiss()
                          })
                }
            }
            .padding(.top, 30)
            .padding(.trailing, 20)
            
            Form{
                Section () {
                    TextField("Название рецепта: ", text: $newItemName)
                        .font(.system(size: 20, weight: .bold, design: .rounded))
                }
                Section (header: Text("Ингредиенты")) {
                    TextEditor(text: $newItemDiscription)
                        .font(.system(size: 16,  design: .rounded))
                        .lineLimit(nil)
                        .frame(minHeight: 80, maxHeight: .infinity)
                }
                Section (header: Text("Ход готовки")) {
                    TextEditor(text: $cookingProgress)
                        .font(.system(size: 16,  design: .rounded))
                        .lineLimit(nil)
                        .multilineTextAlignment(.leading)
                        .frame(minHeight: 130, maxHeight: .infinity)
                }
            }
        }
    }
}

struct NewChecklistItemView_Previews: PreviewProvider {
    static var previews: some View {
        NewChecklistItemView(cheklist: Cheklist())
    }
}
