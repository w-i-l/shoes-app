//
//  CartServicer.swift
//  Shoes
//
//  Created by mishu on 25.09.2023.
//

import Foundation
import Combine

class CartService {
    
    var cartProducts: CurrentValueSubject<[Product], Never> = .init([])
    
    static let shared = CartService()
    
    private init() {
        
    }
    
    func addProduct(product: Product) {
        if self.cartProducts.value.first(where: { $0.id == product.id }) == nil {
            self.cartProducts.value.append(product)
        }
    }
    
    func removeProduct(productID: String) {
        self.cartProducts.value.removeAll { $0.id == productID}
    }
    
    func isProductInCart(productID: String) -> Bool {
        return self.cartProducts.value.first { $0.id == productID } != nil
    }
}
