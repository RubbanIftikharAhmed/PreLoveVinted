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


enum categoriesEnum: Codable, CaseIterable {
    case men
    case women
    case unisex
    case children
}


protocol itemModelProtocol:Codable {
    var name : String {get}
    var price : Double {get}
    var condition : conditionEnum {get}
    var favourites : Int {get}
    var views : Int {get}
    var isSold : Bool {get}
}



struct ItemModel : itemModelProtocol, Identifiable, Codable{
    typealias ConditionType = conditionEnum
    var id : UUID = UUID()
    var name : String
    var isSold : Bool
    var condition: conditionEnum
    var price: Double
    var brand: String
    var favourites: Int = 0
    var views : Int = 0
    var category : categoriesEnum
    var images : [String]
}
