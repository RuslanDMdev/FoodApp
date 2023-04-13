//
//  BannerDataModel.swift
//  OneLoveApp
//
//  Created by Ruslan Dalgatov on 06.04.2023.
//

import Foundation

// MARK: - BannerModelElement
struct BannerModelElement: Codable {
    let image: String
    let type: String
}

typealias BannerModel = [BannerModelElement]
