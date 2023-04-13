//
//  MainModel.swift
//  OneLoveApp
//
//  Created by Ruslan Dalgatov on 11.04.2023.
//

import Foundation

class NetworkService {
    
    let bannerURLs = [
        URL(string: "https://vanlav.ru/wp-content/uploads/2022/12/1-%D0%BD%D0%BE%D0%B2%D1%8B%D0%B8%CC%86%20%D0%B1%D0%B0%D0%BD%D0%BD%D0%B5%D1%80%20%D0%B2%D0%B0%D0%BD%D0%BB%D0%B0%D0%B2%20%D1%86%D1%83%D0%BC.jpeg")!,
        URL(string: "https://vanlav.ru/wp-content/uploads/2023/01/111234.jpg")!,
        URL(string: "https://vanlav.ru/wp-content/uploads/2023/04/derbent.jpg")!
    ]
    
    func fetchData() {
        guard let url = URL(string: "https://run.mocky.io/v3/01fb73f0-63d0-4891-aa43-dde19bed2ccb") else {
            return
        }
        
        URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            guard let data = data else {
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let categories = try decoder.decode(Category.self, from: data)
                DispatchQueue.main.async {
//                    self?.collectionView.categories = categories
//                    self?.collectionView.reloadData()
//                    print("в колекшнвью столько элементов пришло с сервера = \(categories.count)")
//                    self?.getHeight()
                }
            } catch {
                print(error)
            }
        }.resume()
        
    }
    
}
