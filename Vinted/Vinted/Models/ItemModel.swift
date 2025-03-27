//
//  ItemModel.swift
//  Vinted
//
//  Created by Rubban Iftikhar on 22/03/2025.
//

import Foundation

enum conditionEnum {
    case satisfactory
    case good
    case excellent
    case new
}

protocol itemModelProtocol {
    var name : String {get}
    var price : Double {get}
    var condition : conditionEnum {get}
    var favourites : Int {get}
}


struct ItemModel : itemModelProtocol, Identifiable{
    typealias ConditionType = conditionEnum
    var id : UUID = UUID()
    var name : String
    var condition: conditionEnum
    var price: Double
    var favourites: Int
}
