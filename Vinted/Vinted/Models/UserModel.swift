//
//  UserModel.swift
//  Vinted
//
//  Created by Rubban Iftikhar on 27/03/2025.
//

import Foundation


struct user : Identifiable{
    var id : UUID = UUID()
    var name : String
    var followers: Int
    var following : Int
    var items : ItemModel
}


