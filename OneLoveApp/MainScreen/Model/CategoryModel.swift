//
//  CategoryModel.swift
//  OneLoveApp
//
//  Created by Ruslan Dalgatov on 10.04.2023.
//

import Foundation

// MARK: - CategoryElement
struct CategoryElement: Codable {
    let name: String
    let image: String
    let foodType: String
}

typealias Category = [CategoryElement]
