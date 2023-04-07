//
//  FoodDataModel.swift
//  OneLoveApp
//
//  Created by Ruslan Dalgatov on 07.04.2023.
//

import Foundation

struct Food: Decodable {
    
    let id: Int
    let name: String
    let weight: String
    let price: Int
    let image: URL
    let foodType: String

}
