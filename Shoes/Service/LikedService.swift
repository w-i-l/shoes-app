//
//  LikedService.swift
//  Shoes
//
//  Created by mishu on 21.09.2023.
//

import Foundation

class LikedService {
    static let shared = LikedService()
    
    private var likedProducts: [Product] = []
    
    private init() {
        if let likedProducts = UserDefaults.standard.object(forKey: "likedProducts") as? [Product] {
            self.likedProducts = likedProducts
        }
    }
    
    func getLikedProducts() -> [Product] {
        return self.likedProducts
    }
    
    func isProductLiked(productID: UUID) -> Bool {
        return self.likedProducts.first { $0.id == productID } != nil
    }
    
    func addLikedProduct(product: Product) {
        self.likedProducts.append(product)
    }
    
    func removeLikedProduct(productID: UUID) {
        self.likedProducts.removeAll { $0.id == productID }
    }
}
