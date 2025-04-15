//
//  ItemViewModel.swift
//  Vinted
//
//  Created by Rubban Iftikhar on 27/03/2025.
//

import Foundation
import CoreData

class itemViewModel : ObservableObject {
    
    @Published var searchText : String = ""
    @Published var items : [ItemModel] = []
    init(){
    }
    
    

    
}

extension ItemEntity {
    var favouriteCount: Int {
        get {
            return favourite?.intValue ?? 0 // Convert NSDecimalNumber to Int safely
        }
        set {
            favourite = NSDecimalNumber(value: newValue) // Convert Int to NSDecimalNumber
        }
    }
}

/*
 should store item in core data as
 @Published var items : [ItemEntity] = []
 var container : NSPersistentContainer
 init(){
        container = NSPersistentContainer(name: "Item")
        container.loadPersistentStores { description, error in
            if let error = error as? NSError {
                print("Error loading CoreData: \(error)")
            }
        }
        fetchItems()
 }
 
 func fetchItems() {
     let request = NSFetchRequest<ItemEntity>(entityName: "ItemEntity")
     do{
         items = try container.viewContext.fetch(request)
     } catch let error {
         print(error.localizedDescription)
     }
 }
 
 func addItem(name: String, price: Double, description: String?) {
     let newItem : ItemEntity = ItemEntity(context: container.viewContext)
     newItem.name = name
     newItem.price = price
     newItem.favourite = 0
     if let description = description {
         newItem.itemDescription = description
     } else {
         newItem.itemDescription = ""
     }
     saveItems()
 }
 
 func saveItems(){
     do{
         try container.viewContext.save()
         fetchItems()
     } catch let error {
         print("Error saving \(error)")
     }
 }
 
 func addFavourite(item : ItemEntity) {
     item.favouriteCount += 1
     saveItems()
 }
 
  i need to figure out how to add the views function
 */


