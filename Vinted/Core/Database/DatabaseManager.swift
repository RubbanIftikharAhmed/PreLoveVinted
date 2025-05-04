//
//  DatabaseManager.swift
//  Vinted
//
//  Created by Rubban Iftikhar on 03/05/2025.
//

import Foundation
import SQLite

class DatabaseManager{
    static let shared = DatabaseManager()
    private var db : Connection?
    
    let itemsTable = Table("Items")
    private let id = Expression<String>("id")
    private let name = Expression<String>("name")
    private let isSold = Expression<Bool>("isSold")
    private let condition = Expression<String>("condition") //you cannot use conditionEnum as a type
    private let price = Expression<Double>("price")
    private let favourites = Expression<Int>("favourites")
    private let views = Expression<Int>("views")
    private let category = Expression<String>("category")
    private let images = Expression<String>("images")
    
    private init(){
        
    }
    
    private func setupDatabase(){
        do{
            let path = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
            db = try Connection("\(path)/vinted.sqlite")
        } catch let error {
            print("DEBUG: Database connection failed \(error)")
        }
    }
    
    
    private func createTables() {
        guard let db = db else {return}
        //creating item table
        do{
            try db.run(itemsTable.create(ifNotExists: true) { items in
                items.column(id, primaryKey: true)
                items.column(name)
                items.column(isSold)
                items.column(condition)
                items.column(price)
                items.column(favourites)
                items.column(views)
                items.column(category)
                items.column(images)
            })
        } catch let error {
            print("DEBUG: Error creating tables \(error)")
        }
    }
    
    func addItem(item: ItemModel) {
        guard let db = db else {return}
        do{
            let insert = itemsTable.insert(
                name <- item.name,
                isSold <- item.isSold,
                condition <- item.condition.rawValue,
                price <- item.price,
                category <- encodeCategory(item.category),
                images <- encodeImages(item.images)
            )
            try db.run(insert)
        }catch let error {
            print("DEBUG: error inserting item in the table \(error)")
        }
    }
    
    
    func fetchAllItems() -> [ItemModel]{
        guard let db = db else {return []}
        var items = [ItemModel]()
        do{
            for row in try db.prepare(itemsTable) {
                
                let id = UUID(uuidString: row[id]) ?? UUID()
                let condition = conditionEnum(rawValue: row[condition]) ?? .satisfactory
                let category = decodeCategory(row[category]) ?? .unisex
                let images = decodeImages(row[images])
                
                
                let newItem = ItemModel(
                    id: id,
                    name: row[name],
                    isSold: row[isSold],
                    condition: condition,
                    price: row[price],
                    favourites: row[favourites],
                    views: row[views],
                    category: category,
                    images: images
                    )
                items.append(newItem)
            }
        }catch let error {
            print("DEBUG: error fetching all items \(error)")
        }
        return items
    }
}

// Mark :- Helper functions


private func encodeImages(_ images: [String]) -> String {
    do {
        let data = try JSONEncoder().encode(images)
        return String(data: data, encoding: .utf8) ?? "[]"
    } catch {
        print("Error encoding images: \(error)")
        return "[]"
    }
}

private func decodeImages(_ string: String) -> [String] {
    guard let data = string.data(using: .utf8) else { return [] }
    do {
        return try JSONDecoder().decode([String].self, from: data)
    } catch {
        print("Error decoding images: \(error)")
        return []
    }
}


private func encodeCategory(_ category: categoriesEnum) -> String {
    switch category {
    case .men: return "men"
    case .women: return "women"
    case .unisex: return "unisex"
    case .kids: return "kids"
    }
}

private func decodeCategory(_ string: String) -> categoriesEnum? {
    if string.starts(with: "men.") {
        return .men
    } else if string == "women" {
        return .women
    } else if string == "unisex" {
        return .unisex
    } else if string == "kids" {
        return .kids
    }
    return nil
}

/*

     
     
     

     
     func fetchItems() -> [ItemModel] {
         var items = [ItemModel]()
         do {
                     for row in try db!.prepare(itemsTable) {
                         let item = ItemModel(
                             id: row[id],
                             name: row[name],
                             category: row[category],
                             condition: row[condition]
                         )
                         items.append(item)
                     }
                 } catch {
                     print("Fetch failed: \(error)")
                 }
                 return items
     }
     
     
     func deleteItem(itemID: Int64) {
         let item = itemsTable.filter(id == itemID)
         do {
             try db?.run(item.delete())
         } catch {
             print("Delete failed: \(error)")
         }
     }

     func updateItem(item: ItemModel) {
         let itemToUpdate = itemsTable.filter(id == item.id)
         do {
             try db?.run(itemToUpdate.update(
                 name <- item.name,
                 category <- item.category,
                 condition <- item.condition
             ))
         } catch {
             print("Update failed: \(error)")
         }
     }
     
 }

 */
