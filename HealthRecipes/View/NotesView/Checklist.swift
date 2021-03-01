//  HealthRecipes
//
//  Created by  Sasha Khomenko on 20.01.2021.
//  Copyright © 2021  Sasha Khomenko. All rights reserved.
//


import Foundation

class Cheklist: ObservableObject{
    
    @Published var items: [CheckListItem] = []
    
    init() {
        print("Documents directory is: \(documentsDirectory())")
        print("Data file path is: \(dataFilePath())")
        loadListItems()
    }
    
    func printCheckListComponenet(){
        for item in (0..<self.items.count){
            print("\(self.items[item])")
        }
        print("====================")
    }
    
    func deleteListItem(wichElement: IndexSet){
        self.items.remove(atOffsets: wichElement)
        saveListData()
    }
    
    func moveListItem(wichElement: IndexSet, distantion: Int){
        items.move(fromOffsets: wichElement, toOffset: distantion)
        saveListData()
    }
    
    func documentsDirectory() -> URL {
        let path = FileManager.default.urls(for: .documentDirectory,
                                            in: .userDomainMask)
        return path[0]
    }
    
    func dataFilePath() -> URL{
        return documentsDirectory().appendingPathComponent("Checklist.plst")
    }
    
    func saveListData(){
        let encoder = PropertyListEncoder()
        
        do{
            let data = try encoder.encode(self.items)
            
            try data.write(to: dataFilePath(),
                           options: Data.WritingOptions.atomic)
        }
        catch{
            print("Error encoding item array: \(error.localizedDescription)")
        }
    }
    
    func loadListItems() {
        let path = dataFilePath()
        
        if let data = try? Data(contentsOf: path){
            let decoder = PropertyListDecoder()
            do{
                items = try decoder.decode([CheckListItem].self, from: data)
            }
            catch{
                print("Error decoding item array: \(error.localizedDescription)")
            }
        }
    }
}
