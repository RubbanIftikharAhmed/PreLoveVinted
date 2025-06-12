//
//  ItemViewModel.swift
//  Vinted
//
//  Created by Rubban Iftikhar on 27/03/2025.
//

import Foundation
import UIKit

class ItemViewModel: ObservableObject {
    @Published var searchText: String = ""
    @Published var items: [ItemModel] = []
    
    init() {
        fetchItems()
    }
    
    func fetchItems() {
        DispatchQueue.global(qos: .background).async {
            let fetchedItems = DatabaseManager.shared.fetchAllItems()
            DispatchQueue.main.async {
                self.items = fetchedItems
            }
        }
    }
    
    func addItem(name: String, isSold: Bool, condition: conditionEnum, price: Double, brand: String, category: categoriesEnum, images: [String]) {
        // Use the stored imageStrings
        let newItem = ItemModel(name: name, isSold: isSold, condition: condition, price: price, brand: brand, category: category, images: images)
        
        DispatchQueue.global(qos: .background).async {
            DatabaseManager.shared.addItem(item: newItem)
            self.fetchItems()
        }
    }
}













//extension ItemEntity {
//    var favouriteCount: Int {
//        get {
//            return favourite?.intValue ?? 0 // Convert NSDecimalNumber to Int safely
//        }
//        set {
//            favourite = NSDecimalNumber(value: newValue) // Convert Int to NSDecimalNumber
//        }
//    }
//}

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


/*
 func fetchItems() async {
     guard let url = URL(string: "http://localhost:2466/getItems") else {
         return
     }
     do{
         let (data, _) = try await URLSession.shared.data(from: url)
         print("DEBUG: Received data: \(String(data: data, encoding: .utf8) ?? "Could not convert data to string")")
         let decodedItems = try JSONDecoder().decode([ItemModel].self, from: data)
         await MainActor.run {
             items = decodedItems
         }
     } catch let error {
         print("DEGUB: Failed to fetch items: \(error)")
     }
 }
 
 
 
 
 func addItem(item: ItemModel) async {
     guard let url = URL(string: "http://localhost:2466/putItems") else {
         return
     }
     var request = URLRequest(url: url)
     request.httpMethod = "PUT"
     request.setValue("application/json", forHTTPHeaderField: "Content-Type")
     
     do {
         let encodedItem = try JSONEncoder().encode(item)
         request.httpBody = encodedItem
         
         let (_, response) = try await URLSession.shared.data(for: request)
         if let httpResponse = response as? HTTPURLResponse {
             print("PUT response status: \(httpResponse.statusCode)")
         }
     } catch {
         print("Failed to add item: \(error)")
     }
 }

 */
