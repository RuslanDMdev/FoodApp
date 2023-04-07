//
//  BannerDataModel.swift
//  OneLoveApp
//
//  Created by Ruslan Dalgatov on 06.04.2023.
//

import Foundation

struct BannerDataModel: Decodable {
    
    let id: Int
    let name: String
    let description: String
    let image: URL
}
