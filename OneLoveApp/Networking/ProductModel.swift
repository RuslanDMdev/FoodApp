//
//  ProductModel.swift
//  OneLoveApp
//
//  Created by Ruslan Dalgatov on 18.04.2023.
//

import Foundation

// MARK: - ProductContent
struct ProductContent: CodableModel {
    let productName: String
    let productDescription: String
    let productPrice: Int
    let productType: String
    let imageString: String
}

typealias ProductsContent = [ProductContent]
