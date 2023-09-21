//
//  LikedService.swift
//  Shoes
//
//  Created by mishu on 21.09.2023.
//

import Foundation
import Combine

class LikedService {
    static let shared = LikedService()
    
    private(set) var likedProducts: CurrentValueSubject<[Product], Never> = .init([])
    
    private init() {
        if let likedProducts = UserDefaults.standard.object(forKey: "likedProducts") as? [Product] {
            self.likedProducts.value = likedProducts
        }
    }
    
    func getLikedProducts() -> [Product] {
        return self.likedProducts.value
    }
    
    func isProductLiked(productID: String) -> Bool {
        return self.likedProducts.value.first { $0.id == productID } != nil
    }
    
    func addLikedProduct(product: Product) {
        self.likedProducts.value.append(product)
    }
    
    func removeLikedProduct(productID: String) {
        self.likedProducts.value.removeAll { $0.id == productID }
    }
}
