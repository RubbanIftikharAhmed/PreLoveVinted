//
//  ItemModel.swift
//  Vinted
//
//  Created by Rubban Iftikhar on 22/03/2025.
//

import Foundation

enum conditionEnum : String, Codable{
    case satisfactory
    case good
    case excellent
    case new
}

enum MenCategoryEnum: Codable {
    case clothing
    case footwear
    case accessories
}

enum categoriesEnum: Codable {
    case men(MenCategoryEnum)
    case women
    case unisex
    case kids
    
}


protocol itemModelProtocol:Codable {
    var name : String {get}
    var price : Double {get}
    var condition : conditionEnum {get}
    var favourites : Int {get}
    var views : Int {get}
}



struct ItemModel : itemModelProtocol, Identifiable, Codable{
    typealias ConditionType = conditionEnum
    var id : UUID = UUID()
    var name : String
    var condition: conditionEnum
    var price: Double
    var favourites: Int
    var views : Int
    var category : categoriesEnum
}
