//
//  UserViewModel.swift
//  Vinted
//
//  Created by Rubban Iftikhar on 30/03/2025.
//

import Foundation
import CoreData
class UserViewModel: ObservableObject{
    @Published var users : [UserEntity] = []
    var container : NSPersistentContainer
    
    init(){
        container = NSPersistentContainer(name: "UserModel")
        container.loadPersistentStores { description, error in
            if let error = error as? NSError {
                print ("DEBUG : error loading the persistent stores \(error)")
            }
        }
    }
                        
    func fetchUsers(){
        
    }
}

