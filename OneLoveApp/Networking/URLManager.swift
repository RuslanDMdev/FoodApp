//
//  URLManager.swift
//  OneLoveApp
//
//  Created by Ruslan Dalgatov on 18.04.2023.
//

import Foundation

// MARK: API URL
class URLManager {
    
    let apiURL = "https://run.mocky.io/v3/c4a13c92-91db-47ee-9918-98ad3cc2bf5a"

    static let shared = URLManager()
    private init() {}
}
