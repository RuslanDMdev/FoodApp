//
//  FoodDataModel.swift
//  OneLoveApp
//
//  Created by Ruslan Dalgatov on 06.04.2023.
//

import Foundation

struct FoodDataModel: Decodable {
    
    let id: Int
    let name: String
    let description: String
    let price: Int
    let image: URL
    let foodType: String

}
