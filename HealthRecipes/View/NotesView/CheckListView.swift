//  HealthRecipes
//
//  Created by  Sasha Khomenko on 20.01.2021.
//  Copyright © 2021  Sasha Khomenko. All rights reserved.
//


import SwiftUI

struct CheckListView: View {
    
    @State var newChecklistItemIsVisible = false
    @ObservedObject var checklist = Cheklist()
    init() {
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor(#colorLiteral(red: 0.3125861667, green: 0.6258012002, blue: 0.616612504, alpha: 0.9623057384))]
        
    }
    var body: some View {
        NavigationView(){
            
            Form {
                ForEach(checklist.items){index in
                    RowView(checklistItem: self.$checklist.items[index])
                }
                .onDelete(perform: checklist.deleteListItem)
                .onMove(perform: checklist.moveListItem)
            }
            .navigationBarTitle("Мои рецепты", displayMode: .automatic)
            .navigationBarItems(
                trailing: EditButton())
        }
        .overlay(
            VStack{
                Spacer()
                Button(action: {self.newChecklistItemIsVisible = true}) {
                    Spacer()
                    
                    Image(systemName: "plus.circle.fill")
                        .font(.system(size: 45, weight: .bold, design: .serif))
                        .foregroundColor(Color(#colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)))
                        .shadow(radius: 2)
                }
                .padding(.trailing, 20)
                .padding(.bottom, 30)
            }
        )
        .onAppear(){
            self.checklist.saveListData()
        }
        .sheet(isPresented: $newChecklistItemIsVisible){
            NewChecklistItemView(cheklist: self.checklist)
        }
        .background(Color.red)
    }
}

struct CheckListView_Previews: PreviewProvider {
    static var previews: some View {
        CheckListView()
    }
}
